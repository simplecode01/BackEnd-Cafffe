<?php

    include '../config/connection.php';

    if($_SERVER['REQUEST_METHOD'] == 'GET') {

        date_default_timezone_set('Asia/Jakarta');
        $getdate = date('d M Y H:i:s', time()); 
        $convertget_date = date('dmYHis', time());

        $qry_totaltransaksi = "SELECT COUNT(*) 'totaldata_transaksi' FROM tbl_transaksi";
        $exe_qry_totaltransaksi = mysqli_query($_AUTH, $qry_totaltransaksi);
        $totaldatatransaksi = mysqli_fetch_assoc($exe_qry_totaltransaksi);

        $response["message"] = "Total data saat ini adalah ".$totaldatatransaksi['totaldata_transaksi']." transaksi";
        $response["code"] = 200;
        $response["status"] = true;
        $response["init_datatransaksi"] = [
            "totaldata_transaksisaatini" => $totaldatatransaksi['totaldata_transaksi'],
            "getdate_time" => $convertget_date,
            "kode_unique" => "TRX"
        ];

        echo json_encode($response);
    } else {
        $_response["message"] = trim("Oops! Sory, Request API ini membutuhkan parameter!.");
        $_response["code"] = 400;
        $_response["status"] = false;
        echo json_encode($response);
    }

?>