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

$value = [
          'conducted' => 0,
          'attended'  => 0,
          'success'   => true,
         ];

$result             = mysqli_query($conn, "SELECT * FROM attendance WHERE Student_Id='$studentid'");
$record             = mysqli_fetch_assoc($result);
$value['conducted'] = $record['Lec_Conducted'];
$value['attended']  = $record['Lec_Attended'];



mysqli_close($conn);
echo json_encode($value);

// echo json_encode(['success' => true, 'message' => 'testing response']);
