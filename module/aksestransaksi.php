<?php
    // Adding some code
    include '../config/connection.php';

    if($_SERVER['REQUEST_METHOD'] == 'POST') {

        if (trim($_POST['kode_transaksi']) == "") {
            echo json_encode(array(
                "message" => "Error undefined transaction",
                "code" => 400,
                "status" => false));
                
        } else {
            $kode_transaksi = $_POST['kode_transaksi'];

            $transaksi_today = "SELECT

            tbl_transaksi.kode_transaksi, tbl_pelanggan.nama_pelanggan, SUM(tbl_menu.harga_menu*tbl_detailtransaksi.jumlah_pesanan) 'total_yang_harus_dibayar', tbl_transaksi.metode_pembayaran, tbl_transaksi.total_cash 'uang_cash', tbl_transaksi.total_cash-SUM(tbl_menu.harga_menu*tbl_detailtransaksi.jumlah_pesanan) 'uang_kembalian' 
            
            FROM tbl_detailtransaksi
            JOIN tbl_transaksi ON tbl_detailtransaksi.kode_transaksi=tbl_transaksi.kode_transaksi
            JOIN tbl_menu ON tbl_detailtransaksi.kode_menupesanan=tbl_menu.kode_menupesanan
            JOIN tbl_pelanggan ON tbl_transaksi.kode_pelanggan=tbl_pelanggan.kode_pelanggan
            
            WHERE tbl_transaksi.kode_transaksi = '$kode_transaksi'";

            // Adding code
            $exe_transaksi_today = mysqli_query($_AUTH, $transaksi_today);
            $detailtransaction = mysqli_fetch_assoc($exe_transaksi_today);

            $response["message"] = "Data transaksi ".$kode_transaksi." berhasil di load.";
            $response["code"] = 200;
            $response["status"] = true;
            $response["detail_transaksi"] = [
                "kode_transaksi" => $detailtransaction['kode_transaksi'],
                "nama_pelanggan" => $detailtransaction['nama_pelanggan'],
                "total_yang_harus_dibayar" => $detailtransaction['total_yang_harus_dibayar'],
                "metode_pembayaran" => $detailtransaction['metode_pembayaran'],
                "uang_cash" => $detailtransaction['uang_cash'],
                "uang_kembalian" => $detailtransaction['uang_kembalian']
            ];
            
            echo json_encode($response);

        }
    } else {
        $_response["message"] = trim("Oops! Sory, Request API ini membutuhkan parameter!");
        $_response["code"] = 400;
        $_response["status"] = false;

        echo json_encode($_response);
    }
?>
