<?php
session_start();
error_reporting(E_ALL); 
ini_set('display_errors', 1);
include_once('config.php');

$mod_fname = mysqli_real_escape_string($conn, $_POST['mod_fname']);
$mod_lname = mysqli_real_escape_string($conn, $_POST['mod_lname']);
$mod_email = mysqli_real_escape_string($conn, $_POST['mod_email']);
$mod_password = mysqli_real_escape_string($conn, $_POST['mod_password']);

if (!empty($mod_fname) && !empty($mod_lname) && !empty($mod_email) && !empty($mod_password)) {
    // Check if the email is valid
    if (filter_var($mod_email, FILTER_VALIDATE_EMAIL)) {
        // Check if the email already exists in the database
        $sql = mysqli_query($conn, "SELECT mod_email FROM moderators WHERE mod_email = '$mod_email'");
        if (mysqli_num_rows($sql) > 0) {
            echo "$mod_email - Email already exists";
        } else {
            // Retrieve the total number of moderators to generate a unique ID
            $sql_user = mysqli_query($conn, "SELECT * FROM moderators");
            $num_mods = mysqli_num_rows($sql_user);
            $mod_id = $num_mods + 1;
            
            if (isset($_FILES['image'])) {
                // Handle image upload
                $img_name = $_FILES['image']['name'];
                $img_ext = pathinfo($img_name, PATHINFO_EXTENSION);
                $extensions = ['png', 'jpg', 'jpeg'];
                if (in_array($img_ext, $extensions)) {
                    $time = time();
                    $new_img_name = $time . $img_name;
                    $img_path = "images/" . $new_img_name;
                    if (move_uploaded_file($_FILES['image']['tmp_name'], $img_path)) {
                        // Hash the password for security
                        $hashed_password = password_hash($mod_password, PASSWORD_DEFAULT);
                        // Insert moderator data into the database
                        $status = "Active Now";
                        $random_id = rand(time(), 100000000);
                        $date = date('Y-m-d H:i:s');
                        $sql_insert = mysqli_query($conn, "INSERT INTO moderators (mod_id, mod_unique_id, mod_fname, mod_lname, mod_email, mod_password, mod_img, mod_status) VALUES ('$mod_id', '$random_id', '$mod_fname', '$mod_lname', '$mod_email', '$hashed_password', '$new_img_name', '$status')");
                        if ($sql_insert) {
                            // Registration successful
                            $sql_select = mysqli_query($conn, "SELECT * FROM moderators WHERE mod_email = '$mod_email'");
                            if (mysqli_num_rows($sql_select) > 0) {
                                $row = mysqli_fetch_assoc($sql_select);
                                $_SESSION['mod_unique_id'] = $row['mod_unique_id'];
                                echo "success";
                            }
                        } else {
                            echo "Something went wrong";
                        }
                    } else {
                        echo "Failed to upload image";
                    }
                } else {
                    echo "Please select an image file (png, jpg, jpeg)";
                }
            } else {
                echo "Please select an image file";
            }
        }
    } else {
        echo "Invalid email";
    }
} else {
    echo "All input fields are required";
}
?>