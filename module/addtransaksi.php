<?php

    if($_SERVER['REQUEST_METHOD']=='POST') {
        $response = array();
        
        $kode_transaksi = $_POST['kode_transaksi'];
        $kode_waitress = $_POST['kode_waitress'];

        require_once('../config/connection.php');
        
        $cek_kodetransaksi = "SELECT * FROM tbl_transaksi WHERE kode_transaksi = '$kode_transaksi'";

        $check_ifexist = mysqli_fetch_array(mysqli_query($_AUTH, $cek_kodetransaksi));

        if(isset($check_ifexist)) {
            $response["message"] = "Oops! Kode Transaksi sudah terdaftar!, Silahkan pakai kode yang lain.";
            $response["status"] = false;
            $response["code"] = 403;
            echo json_encode($response);
        } else {
            $query_insert_transaksi = "INSERT INTO tbl_transaksi (kode_transaksi, kode_waitress) VALUES ('$kode_transaksi', '$kode_waitress');";
                    
            if (mysqli_query($_AUTH, $query_insert_transaksi)) {

                $transaksi_added = "SELECT * FROM tbl_transaksi WHERE kode_transaksi = '$kode_transaksi'";
                $exe_transaksi_added = mysqli_query($_AUTH, $transaksi_added);

                $response["message"] = "Data Transaksi berhasil ditambahkan";
                $response["status"] = true;
                $response["code"] = 201;
                $response["added_transaksi"] = array();
    
                while ($row = mysqli_fetch_array($exe_transaksi_added)) {
                    $data = array();
    
                    $data["kode_transaksi"] = $row["kode_transaksi"];
                    $data["kode_pelanggan"] = $row["kode_pelanggan"];
                    $data["tanggal_transaksi"] = $row["tanggal_transaksi"];
                    $data["metode_pembayaran"] = $row["metode_pembayaran"];
                    $data["total_cash"] = $row["total_cash"];
                    $data["kode_waitress"] = $row["kode_waitress"];
    
                    array_push($response["added_transaksi"], $data);
                }
                echo json_encode($response);
            } else {
                $response["message"] = "Oops! Maaf transaksi harap coba lagi!";
                $response["status"] = false;
                echo json_encode($response);
            }
        }
        mysqli_close($_AUTH);
    } else {
        $response["message"] = "Oops! Sory, Request API ini membutuhkan parameter!";
        $response["status"] = false;
        echo json_encode($response);
    }
?>