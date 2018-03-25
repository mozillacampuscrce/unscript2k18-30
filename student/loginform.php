<?php
if (isset($_SESSION) === false) {
    session_start();
}

header('Content-Type: text/html; charset=utf-8');

if (isset($_SESSION) && isset($_SESSION['Teacher_Id'])) {
    header('Location: add.php');
    exit;
}

if ((isset($_POST['Useremail']) === true) && (isset($_POST['Password']) === true)) {
    checkLogin($_POST['Useremail'], $_POST['Password']);
    header('Location: add.php');
    exit;
} else {
    header('Location: login.php');
    exit;
}


function checkLogin(string $Useremail, string $password)
{
    $row  = null;
    $conn = mysqli_connect('localhost', 'r1234', 'myPass', 'mccProj');
    $prep = mysqli_prepare($conn, 'SELECT * FROM teacher WHERE Teacher_Id=?');
    mysqli_stmt_bind_param($prep, 's', $Useremail);
    mysqli_execute($prep);
    $result = _fetchAssocStatement($prep);
    if (count($result) === 0) {
        mysqli_close($conn);
        $_SESSION['error'] = 'Invalid login';
        header('Location: login.php');
        exit;
    }

    $row = $result[0];
    mysqli_close($conn);
    //$password = password_hash($_POST['Password'], PASSWORD_DEFAULT, ['cost' => 9]);
    if ($password == $row['password']) {
        $_SESSION['Teacher_Id'] = $row['Teacher_Id'];
        return;
    } else {
        $_SESSION['error'] = 'Invalid login';
        header('Location: login.php');
        exit;
    }

}//end checkLogin()


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
