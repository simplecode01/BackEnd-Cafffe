<?php
    include '../config/connection.php';

    if($_SERVER['REQUEST_METHOD'] == 'GET') {
        $list_transaksi = "SELECT * FROM tbl_transaksi ORDER BY tanggal_transaksi ASC";
        $exe_listtransaksi = mysqli_query($_AUTH, $list_transaksi);

        $response["message"] = trim("Data berhasil ditampilkan.");
        $response["code"] = 200;
        $response["status"] = true;
        $response["listtransaksi"] = array();

        while ($row = mysqli_fetch_array($exe_listtransaksi)) {
            $data = array();

            $data["kode_transaksi"] = $row["kode_transaksi"];
            $data["kode_pelanggan"] = $row["kode_pelanggan"];
            $data["tanggal_transaksi"] = $row["tanggal_transaksi"];
            $data["metode_pembayaran"] = $row["metode_pembayaran"];
            $data["total_cash"] = $row["total_cash"];
            $data["kode_waitress"] = $row["kode_waitress"];

            array_push($response["listtransaksi"], $data);
        }
        echo json_encode($response);
    } else {
        $_response["message"] = trim("Oops! Sory, Request API ini membutuhkan parameter!.");
        $_response["code"] = 400;
        $_response["status"] = false;

        echo json_encode($response);
    }

?>