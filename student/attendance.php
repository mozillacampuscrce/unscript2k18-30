<?php
// include our OAuth2 Server object
require_once __DIR__.'/server.php';

// Handle a request to a resource and authenticate the access token
// if (!$server->verifyResourceRequest(OAuth2\Request::createFromGlobals())) {
//     $server->getResponse()->send();
//     exit;
// }
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



$conn = mysqli_connect('localhost', 'r1234', 'myPass', 'mccProj');
// $clientDetails = $server->getResourceController()->getToken();
// $client_id     = $clientDetails['client_id'];
$strec1 = mysqli_query($conn, "SELECT * FROM oauth_access_tokens WHERE access_token='{$input['access_token']}'");
if (mysqli_num_rows($strec1) == 0) {
    echo json_encode(['error' => 'Invalid token']);
    exit;
}

$strow1 = mysqli_fetch_assoc($strec1);

$strec     = mysqli_query($conn, "SELECT Student_Id FROM account WHERE Account_Id='{$strow1['client_id']}'");
$strow     = mysqli_fetch_assoc($strec);
$studentid = $strow['Student_Id'];

$value = ['success' => true];

$conn       = mysqli_connect('localhost', 'r1234', 'myPass', 'mccProj');
$result     = mysqli_query($conn, "SELECT Current_Sem FROM account WHERE Student_Id='$studentid'");
$studrecord = mysqli_fetch_assoc($result);
$curr_sem   = $studrecord['Current_Sem'];
$result     = mysqli_query($conn, "SELECT * FROM subject_record WHERE Student_Id='$studentid'");
while ($record = mysqli_fetch_assoc($result)) {
    $value[$record['Subject_Id']] = [
                                     'conducted' => $record['Lecture_Conducted'],
                                     'attended'  => $record['Lecture_Attended'],
                                    ];
}



mysqli_close($conn);
echo json_encode($value);

// echo json_encode(['success' => true, 'message' => 'testing response']);
