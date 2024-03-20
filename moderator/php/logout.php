<?php
session_start();
include_once "config.php";
error_reporting(E_ALL); 
ini_set('display_errors', 1);

// Check if mod_unique_id is set in the session
if (isset($_SESSION['mod_unique_id'])) {
    // Escape the logout_id
    $logout_id = mysqli_real_escape_string($conn, $_GET['logout_id']);

    // Check if logout_id is set
    if (isset($logout_id)) {
        // Update mod_status to indicate offline
        $status = "offline now";
        $sql = mysqli_query($conn, "UPDATE moderators SET mod_status = '$status' WHERE mod_unique_id = '$logout_id'");

        // Check if the update query was successful
        if ($sql) {
            // Unset and destroy the session
            session_unset();
            session_destroy();
            header('location: ../login.php');
            exit; // Make sure to exit after redirection
        } else {
            echo "Failed to update status.";
        }
    }
} else {
    // Redirect to login page if mod_unique_id is not set in the session
    header('Location:../login.php');
    exit; // Make sure to exit after redirection
}
?>