<?php
session_start();
include_once('config.php');

$mod_email = mysqli_real_escape_string($conn, $_POST['mod_email']);
$mod_password = mysqli_real_escape_string($conn, $_POST['mod_password']);

if (!empty($mod_email) && !empty($mod_password)) {
    $sql = mysqli_query($conn, "SELECT * FROM moderators WHERE mod_email = '$mod_email'");
    if ($sql && mysqli_num_rows($sql) > 0) {
        $row = mysqli_fetch_assoc($sql);
        $hashed_password = $row['mod_password'];
        if (password_verify($mod_password, $hashed_password)) {
            $status = "Active now";
            $update_sql = mysqli_query($conn, "UPDATE moderators SET mod_status = '$status' WHERE mod_unique_id = '{$row['mod_unique_id']}'");
            if ($update_sql) {
                $_SESSION['mod_unique_id'] = $row['mod_unique_id'];
                echo "success";
            } else {
                echo "Failed to update status.";
            }
        } else {
            echo "Email or password is incorrect.";
        }
    } else {
        echo "Email or password is incorrect.";
    }
} else {
    echo "All input fields are required";
}
?>