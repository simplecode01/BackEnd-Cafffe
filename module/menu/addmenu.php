<?php

    if ($_SERVER['REQUEST_METHOD']=='POST') {
        $response = array();

        $kode_menupesanan = $_POST['kode_menupesanan'];
        $nama_menu = $_POST['nama_menu'];   
        $harga_menu = $_POST['harga_menu'];
        $kategori = $_POST['kategori'];
        $img_menu = $_POST['img_menu'];
        require_once('../../config/connection.php');
        
        $cek_kodemenu = "SELECT * FROM tbl_menu WHERE kode_menupesanan = '$kode_menupesanan'";
        $check_ifexist1 = mysqli_fetch_array(mysqli_query($_AUTH, $cek_kodemenu));

        $cek_namamenu = "SELECT * FROM tbl_menu WHERE nama_menu ='$nama_menu'";
        $check_ifexist2 = mysqli_fetch_array(mysqli_query($_AUTH, $cek_namamenu));

        if (isset($check_ifexist1)) {
            $response["message"] = "Error use another kode for menu";
            $response["status"] = false;
            $response["code"] = 403;
            echo json_encode($response);

        }else if (isset($check_ifexist2)){
            $response["message"] = "Error menu already in database";
            $response["status"] = false;
            $response["code"] = 403;
            echo json_encode($response);

        }else {

            $query_insert_menu = "INSERT INTO tbl_menu (kode_menupesanan, nama_menu, harga_menu, kategori, img_menu) VALUES ('$kode_menupesanan', '$nama_menu', '$harga_menu', '$kategori', '$img_menu')";
                    
            if (mysqli_query($_AUTH, $query_insert_menu)) {
                $response["message"] = "Data Menu successful added";
                $response["status"] = true;
                $response["code"] = 201;
                echo json_encode($response);
            } else {
                $response["message"] = "Error try again please";
                $response["status"] = false;
                echo json_encode($response);
            }
        }
        mysqli_close($_AUTH);
    }else {
        $response["message"] = "Error need API";
        $response["status"] = false;
        echo json_encode($response);
    }
?>