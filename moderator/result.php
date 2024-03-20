<?php 
    session_start();
    include_once("/Applications/XAMPP/xamppfiles/htdocs/moderator/php/config.php");
    error_reporting(E_ALL);
    ini_set('display_errors', 1);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Realtime Chat App</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="style1.css">
    <title>View Records</title>
    <style>
        .button-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: right; /* Optional: Align buttons horizontally at the center */
            margin-top: 20px;
        }

        .button {
            padding: 10px 20px;
            background-color: #363a3e;
            border: none;
            color: white;
            font-size: 12px;
            margin-right: 10px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .button:hover {
            background-color: #4c4f51;
        }
    </style>
</head>
<body class="bg-dark">
<div class="card mt-5">
    <form method="POST" action="">
        <center><header>MODERATION LOG</header></center>
        <table border='1'>
            <tr>
                <td> Log ID </td>
                <td> Moderator ID </td>
                <td> Message ID </td>
                <td> Message </td>
                <td> Action  </td>
                <td> Submit </td>
            </tr>

            <?php
            include_once("/Applications/XAMPP/xamppfiles/htdocs/moderator/php/config.php");
            $result = mysqli_query($conn,"SELECT * FROM moderation");
            while($row=mysqli_fetch_assoc($result))
            {
                $logid = $row['log_id'];
                $m_id = $row['msg_id'];
                $msg_result = mysqli_query($conn, "SELECT msg FROM messages WHERE msg_id='$m_id'");
                $msg_row = mysqli_fetch_assoc($msg_result);
                $msg = $msg_row['msg'];
                $mod_ids = $row['moder_id'];
                $act = $row['action'] ?? 'null'; // Set default value for action if it's null

                // Check if form is submitted for this row
                if(isset($_POST['update_'.$logid])){
                    // Check if the row has not been submitted before
                    if(empty($_POST['submitted_'.$logid])){
                        // Set default value for moder_id if it's 0
                        $mod_ids = $_POST['mod_id_'.$logid] ?? null;

                        // Update action only if it's not set in the form data
                        if(isset($_POST['action_'.$logid])) {
                            $act = $_POST['action_'.$logid];
                        }

                        $inser = mysqli_query($conn,"UPDATE moderation SET moder_id='$mod_ids', action='$act' WHERE log_id='$logid'");
                        if($act=='No'){
                            $drop = mysqli_query($conn,"DELETE FROM moderation WHERE log_id='$logid'");
                            ?>
                        <script>
                            alert("Record successfully deleted and is updated in the backup!");
                            setTimeout(function() {
                                    window.location.reload();
                                }, 200);
                        </script>
                        <?php
                        }
                        else{
                            ?>
                        <script>
                            alert("Updation successful!");
                            setTimeout(function() {
                                    window.location.reload();
                                }, 200);
                        </script>
                        <?php
                        
                        }

                        // Set flag indicating that the row has been submitted
                        $_POST['submitted_'.$logid] = true;
                    }
                }
            ?>
            <tr>
                <td><?php echo $logid ?></td>
                <td><input type="text" name="mod_id_<?php echo $logid ?>" value="<?php echo $mod_ids ?>"></td>
                <td><?php echo $m_id ?></td>
                <td><?php echo $msg ?></td>
                <td><input type="text" name="action_<?php echo $logid ?>" value="<?php echo $act ?>"></td>
                <td><button name="update_<?php echo $logid ?>" type="submit">Update</button></td>
            </tr>
            <?php 
            } 
            ?>                                                                    
        </table>
    </form>


<form action="php/logout.php" method="GET">
    <input type="hidden" name="logout_id" value="<?php echo isset($_SESSION['mod_unique_id']) ? $_SESSION['mod_unique_id'] : ''; ?>" >
    <button class="lbtn" type="submit">Logout</button>
</form>
<div class="button-container">
    <form action='backup.php'>
        <button class='button' type='submit'>Deleted records.</button>
    </form>
    <form action='view.php'>
        <button class='button' type='submit'>View abusers details</button>
    </form>
</div>
<br>
<footer> <center><p>Thankyou for your support!</p></center></footer>
</div>
</body>
</html>