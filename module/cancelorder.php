<?php

    if($_SERVER['REQUEST_METHOD']=='POST') {
        require_once('../config/connection.php');
        $kode_transaksi = $_POST['kode_transaksi'];

        $cek_kodetransaksi = "SELECT * FROM tbl_transaksi WHERE kode_transaksi = '$kode_transaksi'";
        $check_ifexist = mysqli_fetch_array(mysqli_query($_AUTH, $cek_kodetransaksi));
        
        if($check_ifexist) {

            $query_cancelorder = "DELETE FROM tbl_transaksi WHERE kode_transaksi = '$kode_transaksi'";
            $execute_querycancelorder = mysqli_query($_AUTH, $query_cancelorder);

            if($execute_querycancelorder) {
                $response["message"] = "Pesanan berhasil dibatalkan";
                $response["status"] = false;
                $response["code"] = 200;
            } else {
                $response["message"] = "Pesanan gagal untuk di batalkan";
                $response["status"] = false;
                $response["code"] = 401;
            }

            echo json_encode($response);
        } else {
            $response["message"] = "Sory, Data tidak tersedia di database, silahkan cek kembali kode.";
            $response["status"] = false;
            $response["code"] = 403;
            echo json_encode($response);
        }
        
    } else {
        $response["message"] = "Oops! Sory, Request API ini membutuhkan parameter!";
        $response["status"] = false;
        echo json_encode($response);
    }
?>