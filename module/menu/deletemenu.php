<?php
    if ($_SERVER['REQUEST_METHOD']=='POST') {
        $response = array();

        $nama_menu = $_POST['nama_menu'];
        require_once('../../config/connection.php');

        $query_delete_menu = "DELETE FROM tbl_menu  WHERE nama_menu = '$nama_menu'";

        if (mysqli_query($_AUTH, $query_delete_menu)) {

            $response["message"] = "Menu has been delete";
            $response["code"] = 201;
            $response["status"] = true;
            
            echo json_encode($response);

        } else {
            $response["message"] = "Error Try again";
            $response["code"] = 403;
            $response["status"] = false;
            echo json_encode($response);
        }
        mysqli_close($_AUTH);

    }else {
        $response["message"] = "Error Need API";
        $response["status"] = false;
        echo json_encode($response);
    }

?>