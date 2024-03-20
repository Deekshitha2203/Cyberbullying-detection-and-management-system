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
        <center><header>ABUSERS</header></center>
        <table border='1'>
            <tr>
                <th> First Name </th>
                <th> Last Name </th>
                <th> Outgoing ID </th>
                <th> Email</th>
                <th> Status </th>
                <th> Message </th>
            </tr>

            <?php
            include_once("/Applications/XAMPP/xamppfiles/htdocs/moderator/php/config.php");
            $result = mysqli_query($conn,"SELECT * FROM abusers");
            while($row=mysqli_fetch_assoc($result))
            {
                $fn = $row['fname'];
                $ln = $row['lname'];
                $outgoing_msg_id = $row['outgoing_msg_id'];
                $mail = $row['email'];
                $stat = $row['status'];
                $msg = $row['msg'];
            ?>
            <tr>
                <td><?php echo $fn ?></td>
                <td><?php echo $ln ?></td>
                <td><?php echo $outgoing_msg_id ?></td>
                <td><?php echo $mail ?></td>
                <td><?php echo $stat ?></td>
                <td><?php echo $msg ?></td>
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



