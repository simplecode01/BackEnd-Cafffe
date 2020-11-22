<?php
    if($_SERVER['REQUEST_METHOD']=='POST') {

        
        $jumlah_pesanan = $_POST['jumlah_pesanan'];

    }else {
        $response["message"] = "Oops! Sory, Request API ini membutuhkan parameter!";
        $response["status"] = false;
        echo json_encode($response);
    }
?>