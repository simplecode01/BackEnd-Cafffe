<?php

    if($_SERVER['REQUEST_METHOD']=='POST') {
        $response = array();
        $kode_transaksi = $_POST['kode_transaksi'];
        require_once('../../config/connection.php');

        $cek_kodetransaksi = "SELECT * FROM tbl_detailtransaksi WHERE kode_transaksi = '$kode_transaksi'";
        $check_ktissexist = mysqli_fetch_array(mysqli_query($_AUTH, $cek_kodetransaksi));

        $query_totalbayar = "SELECT SUM(tbl_menu.harga_menu*tbl_detailtransaksi.jumlah_pesanan) 'total_bayar'
        FROM tbl_detailtransaksi
            
        JOIN tbl_menu ON tbl_menu.kode_menupesanan=tbl_detailtransaksi.kode_menupesanan
        JOIN tbl_transaksi on tbl_transaksi.kode_transaksi=tbl_detailtransaksi.kode_transaksi
            
        WHERE tbl_detailtransaksi.kode_transaksi = '$kode_transaksi'";
        $exe_query_totalbayar = mysqli_query($_AUTH, $query_totalbayar);
        $totalbayar_transaksi = mysqli_fetch_assoc($exe_query_totalbayar);

        if(isset($check_ktissexist)) {
            $response["message"] = trim("Kode transaksi $kode_transaksi tersedia di database, dan data menu berhasil ditampilkan.");
            $response["code"] = 201;
            $response["status"] = true;
            $response["total_bayar"] = $totalbayar_transaksi['total_bayar'];
            $response["listmenu_inchart"] = array();

            $querylistmenuinchart = "SELECT tbl_detailtransaksi.kode_transaksi, tbl_menu.kode_menupesanan, tbl_menu.nama_menu, tbl_menu.harga_menu, tbl_menu.kategori, tbl_detailtransaksi.jumlah_pesanan, tbl_menu.harga_menu*tbl_detailtransaksi.jumlah_pesanan 'jumlah_harga'
            FROM tbl_detailtransaksi
            
            JOIN tbl_menu ON tbl_menu.kode_menupesanan=tbl_detailtransaksi.kode_menupesanan
            JOIN tbl_transaksi on tbl_transaksi.kode_transaksi=tbl_detailtransaksi.kode_transaksi
            
            WHERE tbl_detailtransaksi.kode_transaksi = '$kode_transaksi'";
            $exe_querylistmenuinchart = mysqli_query($_AUTH, $querylistmenuinchart);

            if (mysqli_query($_AUTH, $querylistmenuinchart)) {

                while ($row = mysqli_fetch_array($exe_querylistmenuinchart)) {
                    $data = array();
                    
                    $data["kode_transaksi"] = $row["kode_transaksi"];
                    $data["kode_menupesanan"] = $row["kode_menupesanan"];
                    $data["nama_menu"] = $row["nama_menu"];
                    $data["harga_menu"] = $row["harga_menu"];
                    $data["kategori"] = $row["kategori"];
                    $data["jumlah_pesanan"] = $row["jumlah_pesanan"];
                    $data["jumlah_harga"] = $row["jumlah_harga"];

                    array_push($response["listmenu_inchart"], $data);
                }
                echo json_encode($response);
            } else {
                $response["message"] = trim("Data menu gagal ditampilkan. Silahakan cek kembali request!");
                $response["status"] = false;
                $response["code"] = 403;
                echo json_encode($response);
            }
        } else {
            $response["message"] = "Kode transaksi $kode_transaksi tidak tersedia didatabase, cek kembali kode transaksi anda.";
            $response["status"] = false;
            $response["code"] = 404;
            echo json_encode($response);
        }
    } else {
        $response["message"] = "Oops! Sory, Request API ini membutuhkan parameter!";
        $response["status"] = false;
        echo json_encode($response);
    }

?>