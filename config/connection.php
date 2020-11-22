<?php

    $_SERVER_DB = "localhost";
    $_USERNAME_DB = "id14899616_testcaffe11";
    $_PASSWORD_DB = "S}^S?/k4fdPM[RmR";
    $_DATABASE_DB = "id14899616_testcaffe";

    $_AUTH = mysqli_connect($_SERVER_DB, $_USERNAME_DB, $_PASSWORD_DB, $_DATABASE_DB);

    if ($_AUTH) { 
         //echo json_encode(array(
             //"message" => "Congratulation!, your connection is successfully. To database ".$_DATABASE_DB, 
             //"code" => 200, 
             //"status" => true)
         //);
    }
?>