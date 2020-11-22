<?php
    include '../config/connection.php';

    if($_SERVER['REQUEST_METHOD'] == 'GET') {
        $list_menu = "SELECT * FROM tbl_menu";
        $execute_qry_listmenu = mysqli_query($_AUTH, $list_menu);

        $response["message"] = trim("Data menu berhasil ditampilkan.");
        $response["code"] = 200;
        $response["status"] = true;
        $response["listmenu"] = array();

        while ($row = mysqli_fetch_array($execute_qry_listmenu)) {
            $data = array();

            $data["kode_menupesanan"] = $row["kode_menupesanan"];
            $data["nama_menu"] = $row["nama_menu"];
            $data["harga_menu"] = $row["harga_menu"];
            $data["kategori"] = $row["kategori"];
            $data["img_menu"] = $row["img_menu"];

            array_push($response["listmenu"], $data);
        }
        echo json_encode($response);
    } else {
        $_response["message"] = trim("Oops! Sory, Request API ini membutuhkan parameter!.");
        $_response["code"] = 400;
        $_response["status"] = false;

        echo json_encode($response);
    }

?>