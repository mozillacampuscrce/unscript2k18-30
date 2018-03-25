<?php
if (isset($_SESSION) === false) {
    session_start();
}

header('Content-Type: text/html; charset=utf-8');

if (!isset($_SESSION) || (!isset($_SESSION['Teacher_Id']))) {
    header('Location: login.php');
    exit;
}

if (!isset($_POST) || !isset($_POST['subject'])) {
    $_SESSION['error'] = 'Invalid request';
    header('Location: add.php');
    exit;
}

$tid    = $_SESSION['Teacher_Id'];
$conn   = mysqli_connect('localhost', 'r1234', 'myPass', 'mccProj');
$result = mysqli_query($conn, "SELECT * FROM subject WHERE Teacher_Id='$tid'");

$subjects = [];
$row      = null;
while ($row = mysqli_fetch_assoc($result)) {
    array_push($subjects, $row['Subject_Id']);
}

if (!in_array($_POST['subject'], $subjects)) {
    $_SESSION['error'] = 'Invalid request';
    header('Location: add.php');
    exit;
}


$presStudIds = [];
if (isset($_POST['studId'])) {
    foreach ($_POST['studId'] as $key => $value) {
        array_push($presStudIds, $key);
    }
}

$record = mysqli_query($conn, "SELECT * FROM subject_record WHERE Subject_Id='{$_POST['subject']}'");

while ($row2 = mysqli_fetch_assoc($record)) {
    if (in_array($row2['Student_Id'], $presStudIds)) {
        mysqli_query($conn, "UPDATE subject_record SET Lecture_Attended=Lecture_Attended+1,Lecture_Conducted=Lecture_Conducted+1 WHERE Student_Id='{$row2['Student_Id']}' AND Subject_Id='{$_POST['subject']}'");
        mysqli_query($conn, "UPDATE attendance SET Lec_Attended=Lec_Attended+1,Lec_Conducted=Lec_Conducted+1 WHERE Student_Id='{$row2['Student_Id']}'");
    } else {
        mysqli_query($conn, "UPDATE subject_record SET Lecture_Conducted=Lecture_Conducted+1 WHERE Student_Id='{$row2['Student_Id']}' AND Subject_Id='{$_POST['subject']}'");
        mysqli_query($conn, "UPDATE attendance SET Lec_Conducted=Lec_Conducted+1 WHERE Student_Id='{$row2['Student_Id']}'");
    }

    //$subjects[$row['Subject_Id']] = $studIds;
}

header('Location: add.php');
