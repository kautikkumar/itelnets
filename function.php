<?php
require_once('./config.php');

$method = $_SERVER['REQUEST_METHOD'];

if ( $method == 'POST' ) {
    if ( $_POST['action'] == 'submit_contact_us' ) {
        $query = "INSERT INTO contact_us (`first_name`,`last_name`,`email`,`message`)  VALUES (?,?,?,?);";
        $sql = mysqli_prepare($conn, $query);
        mysqli_stmt_bind_param($sql, 'ssss', $_POST['first_name'], $_POST['last_name'], $_POST['email'], $_POST['message']);
        $result = mysqli_stmt_execute($sql);
        if ( $result ) {
            echo json_encode(['status' => true, 'message' => 'Thank You! We are appreiciate Your interst']);
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