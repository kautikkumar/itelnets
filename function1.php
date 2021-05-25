<?php
require_once('./config.php');

$method = $_SERVER['REQUEST_METHOD'];

if ( $method == 'POST' ) {
    if ( $_POST['action1'] == 'submit_contact_us1' ) {
        $query = "INSERT INTO subscribe (`s_email`)  VALUES (?);";
        $sql = mysqli_prepare($conn, $query);
        mysqli_stmt_bind_param($sql, 's', $_POST['s_email']);
        $result = mysqli_stmt_execute($sql);
        if ( $result ) {
            echo json_encode(['status' => true, 'message' => 'Subscribed']);
        } else {
            echo json_encode(['status' => false, 'message' => 'Submit Fail']);
        }
        die;
    } else {
        header('location: index.php');
    }
} else {
    header('location: index.php');
}