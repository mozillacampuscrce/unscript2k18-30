<?php
if (isset($_SESSION) === false) {
    session_start();
}

header('Content-Type: text/html; charset=utf-8');
if (isset($_SESSION) && isset($_SESSION['Teacher_Id'])) {
    unset($_SESSION['Teacher_Id']);
}

header('Location: login.php');
exit;
