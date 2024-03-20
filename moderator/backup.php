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
    <title>Backup</title>
</head>
<body class="bg-dark">
<div class="card mt-5">
    <form method="POST" action="">
        <center><header>MODERATION LOG (BACK-UP)</header></center>
        <table border='1'>
            <tr>
                <th> Log ID </th>
                <th> Moderator ID </th>
                <th> Message ID </th>
                <th> Action  </th>
                <th> Deleted at </th>
            </tr>

            <?php
            include_once("/Applications/XAMPP/xamppfiles/htdocs/moderator/php/config.php");
            $result = mysqli_query($conn,"SELECT * FROM moderation_backup");
            while($row=mysqli_fetch_assoc($result))
            {
                $logid = $row['log_id'];
                $m_id = $row['moder_id'];
                $msg_id = $row['msg_id'];
                $action = $row['action'];
                $del = $row['deleted_at'];
            ?>
            <tr>
                <td><?php echo $logid ?></td>
                <td><?php echo $m_id ?></td>
                <td><?php echo $msg_id ?></td>
                <td><?php echo $action ?></td>
                <td><?php echo $del ?></td>
            </tr>
            <?php
            } 
            ?>
        </table>
    </form>
    <form action='result.php'>
        <br>
        <button type='submit'>Back</button>
    </form>
</div>
</body>
</html>



