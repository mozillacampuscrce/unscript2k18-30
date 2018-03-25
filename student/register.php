<?php

// https://www.leaseweb.com/labs/2015/10/creating-a-simple-rest-api-in-php/
// get the HTTP method, path and body of the request
$method = $_SERVER['REQUEST_METHOD'];
// $request = explode('/', trim($_SERVER['PATH_INFO'], '/'));
if ($method === 'POST') {
    $input = json_decode(file_get_contents('php://input'), true);
    if ($input === null) {
        echo json_encode(['error' => 'Invalid json']);
        exit;
    }
} else {
    echo json_encode(['error' => 'Invalid post']);
    exit;
}

if (isset($input['accountid']) && isset($input['token']) && isset($input['password'])) {
    if (mb_strlen($input['accountid']) < 3 || mb_strlen($input['accountid']) > 20) {
        echo json_encode(['error' => 'Invalid accountid']);
        exit;
    }

    if (mb_strlen($input['password']) <= 6 && mb_strlen($input['password']) > 50) {
        echo json_encode(['error' => 'Invalid password']);
        exit;
    }

    // if ($input['password'] !== $input['confpass']) {
    //     echo json_encode(['error' => 'Passwords do not match']);
    //     exit;
    // }
} else {
    echo json_encode(['error' => 'Invalid params']);
    exit;
}//end if

// connect to the mysql database
$conn = mysqli_connect('localhost', 'r1234', 'myPass', 'mccProj');
// mysqli_set_charset($conn, 'utf8');

$prep = mysqli_prepare($conn, 'SELECT * FROM account WHERE Account_Id=? AND Token=?');
mysqli_stmt_bind_param($prep, 'ss', $input['accountid'], $input['token']);
mysqli_execute($prep);
$rowresults = _fetchAssocStatement($prep);
if (count($rowresults) == 0) {
    echo json_encode(['error' => 'Invalid accountid/token']);
    exit;
} else if ($rowresults[0]['TokenValid'] == 'No') {
    echo json_encode(['error' => 'Already registered']);
    exit;
}

mysqli_stmt_close($prep);

$prep     = mysqli_prepare($conn, 'INSERT INTO oauth_clients (client_id, client_secret, redirect_uri) VALUES (?,?, "http://localhost/")');
//$password = password_hash($input['password'], PASSWORD_DEFAULT, ['cost' => 9]);
mysqli_stmt_bind_param($prep, 'ss', $input['accountid'], $input['password']);
mysqli_execute($prep);
mysqli_query($conn, "UPDATE account SET TokenValid='No' WHERE Account_Id='{$input['accountid']}'");
mysqli_close($conn);
echo json_encode(['success' => true]);
exit;


function _fetchAssocStatement($stmt)
{
    $stmt->store_result();
    if ($stmt->num_rows > 0) {
        $allresult = [];
        $result    = [];
        $md        = $stmt->result_metadata();
        $params    = [];
        while ($field = $md->fetch_field()) {
            $params[] = &$result[$field->name];
        }

        call_user_func_array([$stmt, 'bind_result'], $params);
        $i = 0;
        while ($stmt->fetch()) {
            $allresult[$i++] = $result;
        }

        return $allresult;
    }

        return null;

}//end _fetchAssocStatement()
