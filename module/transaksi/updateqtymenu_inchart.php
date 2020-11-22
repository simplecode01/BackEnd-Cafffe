<?php

    if($_SERVER['REQUEST_METHOD']=='POST') {
        $response = array();
        
        $kode_relasi = $_POST['kode_relasi'];
        $kode_menu = $_POST['kode_menupesanan'];
        $kode_transaksi = $_POST['kode_transaksi'];

        require_once('../../config/connection.php');
        
        $cek_data = "SELECT * FROM tbl_detailtransaksi WHERE kode_relasi = $kode_relasi AND kode_transaksi = '$kode_transaksi' AND kode_menupesanan = '$kode_menu'";

        $check_ifexist = mysqli_fetch_array(mysqli_query($_AUTH, $cek_data));

        if(isset($check_ifexist)) {            
            $update_qty = $_POST['jumlah_pesanan'];

            $query_updateqtymenu_incart = "UPDATE tbl_detailtransaksi SET jumlah_pesanan = $update_qty WHERE kode_relasi = $kode_relasi AND kode_transaksi = '$kode_transaksi' AND kode_menupesanan = '$kode_menu'";
                    
            if (mysqli_query($_AUTH, $query_updateqtymenu_incart)) {

                $qty_updated = "SELECT * FROM tbl_detailtransaksi WHERE kode_relasi = $kode_relasi AND kode_transaksi = '$kode_transaksi' AND kode_menupesanan = '$kode_menu'";
                $exe_qty_updated = mysqli_query($_AUTH, $qty_updated);

                $getJumlahQtyUpdated = "SELECT tbl_detailtransaksi.jumlah_pesanan FROM tbl_detailtransaksi WHERE kode_relasi = $kode_relasi AND kode_transaksi = '$kode_transaksi' AND kode_menupesanan = '$kode_menu'";
                $exe_getJumlahQtyUpdated = mysqli_query($_AUTH, $getJumlahQtyUpdated);
                $jumlah_pesanan_terupdate = mysqli_fetch_assoc($exe_getJumlahQtyUpdated);

                $response["message"] = "Data has been update";
                $response["status"] = true;
                $response["code"] = 201;
                $response["qty_menu_terupdate"] = $jumlah_pesanan_terupdate['jumlah_pesanan'];

                $response["data_updated"] = array();
    
                while ($row = mysqli_fetch_array($exe_qty_updated)) {
                    $data = array();
    
                    $data["kode_relasi"] = $row["kode_relasi"];
                    $data["kode_transaksi"] = $row["kode_transaksi"];
                    $data["kode_menupesanan"] = $row["kode_menupesanan"];
    
                    array_push($response["data_updated"], $data);
                }

                echo json_encode($response);
            } else {
                $response["message"] = "Error please try again";
                $response["status"] = false;
                echo json_encode($response);
            }
        } else {
            $response["message"] = "Error data was not found";
            $response["status"] = false;
            $response["code"] = 404;
            echo json_encode($response);
        }
        mysqli_close($_AUTH);
    } else {
        $response["message"] = "Error need API";
        $response["status"] = false;
        $response["code"] = 403;
        echo json_encode($response);
    }
?>