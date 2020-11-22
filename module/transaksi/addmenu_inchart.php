<?php

    if($_SERVER['REQUEST_METHOD']=='POST') {
        $response = array();
        
        $kode_transaksi = $_POST['kode_transaksi'];
        $kode_menu = $_POST['kode_menupesanan'];
        $jumlah_pesanan = $_POST['jumlah_pesanan'];;
        require_once('../../config/connection.php');
        
        $query_insert_transaksi = "INSERT INTO tbl_detailtransaksi (kode_transaksi, kode_menupesanan, jumlah_pesanan) VALUES ('$kode_transaksi', '$kode_menu', '$jumlah_pesanan' )";
        
        if (mysqli_query($_AUTH, $query_insert_transaksi)) {

            $response["message"] = "Menu berhasil ditambahkan kedalam chart";
            $response["code"] = 201;
            $response["status"] = true;
            
            echo json_encode($response);

        } else {
            $response["message"] = "Oops! Maaf gagal menambahkan kedalam chart! Silahkan coba lagi.";
            $response["code"] = 403;
            $response["status"] = false;
            echo json_encode($response);
        }
        mysqli_close($_AUTH);
    }else {
        $response["message"] = "Oops! Sory, Request API ini membutuhkan parameter!";
        $response["status"] = false;
        echo json_encode($response);
    }
?>