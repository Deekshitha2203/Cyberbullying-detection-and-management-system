
<?php

session_start();
if (isset($_SESSION['unique_id'])) {
    include_once("config.php");
    $outgoing_id = mysqli_real_escape_string($conn, $_POST['outgoing_id']);
    $incoming_id = mysqli_real_escape_string($conn, $_POST['incoming_id']);
    $message = mysqli_real_escape_string($conn, $_POST['message']);
    if (!empty($message)) {
        $ms = mysqli_query($conn, "SELECT * FROM messages");
        $msgs = mysqli_num_rows($ms);
        $msg_id = $msgs + 1;
        $sql =  mysqli_query($conn, "INSERT INTO messages (msg_id,incoming_msg_id, outgoing_msg_id, msg) VALUES ('$msg_id','$incoming_id' , '$outgoing_id' , '$message')");
        $mesgarray = explode(' ', $message);
        $count = 0;

        foreach ($mesgarray as $mseg) {
            $check = mysqli_query($conn, "SELECT keyword_text FROM keywords WHERE keyword_text='$mseg'");
            if (mysqli_num_rows($check) > 0) {
                $count++;
            }
            
        }
        if ($count > 0) {
            $mss = mysqli_query($conn, "SELECT * FROM moderation");
            $msgss = mysqli_num_rows($mss);
            $msgs_id = $msgss + 1;
            $mid = 1;
            $val = 'null';
            $ins = mysqli_query($conn, "INSERT INTO moderation (msg_id, action) VALUES ('$msg_id','$val')");
            $up =  mysqli_query($conn,"UPDATE faulty SET log_id='$msgs_id' where msg_id='$msg_id'");
            ?>
            <script>
                            
                setTimeout(function() {
                window.location.reload();
                }, 200);
            </script>
            <?php
            }  
        foreach ($mesgarray as $mseg) {
            $currentDateTime = date('Y-m-d H:i:s');
            $meg = strtolower($mseg);
            $chck = mysqli_query($conn, "SELECT keyword_id FROM keywords WHERE keyword_text='$meg'");
            if ($chck && mysqli_num_rows($chck) > 0) {
                $ck_row = mysqli_fetch_assoc($chck);
                $keyword_id = $ck_row['keyword_id']; // Fetch keyword_id from the query result
                $msgss_id = mysqli_query($conn, "SELECT MAX(sn_id) AS max_sn_id FROM faulty");
                $msgss_row = mysqli_fetch_assoc($msgss_id);
                $msgss_id = $msgss_row['max_sn_id'] + 1; // Use the maximum sn_id and increment by 1
                $ck =  mysqli_query($conn, "INSERT INTO faulty (sn_id, msg_id, keyword_id,log_id, datetime) VALUES ('$msgss_id', '$msg_id', '$keyword_id','$msgs_id', '$currentDateTime')");
            }  
        }  
    }
} else {
    header("../login.php");
} 