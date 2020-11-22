<?php
    include '../config/connection.php';

    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $kode_user = trim($_POST['kode_user']);
        $namalengkap_user = trim($_POST['namalengkap_user']);
        $telepon_user = trim($_POST['telepon_user']);
        $tanggal_lahiruser = trim($_POST['tanggal_lahiruser']);
        $username_user = trim($_POST['username_user']);
        $password_user = trim($_POST['password_user']);
        $userakses = trim($_POST['userakses']);

        $_query_cekuser_exist = mysqli_query($_AUTH, "SELECT * FROM tbl_signup WHERE username_user = '$username_user'");
        $_execute_cekuser_exist = mysqli_num_rows($_query_cekuser_exist);

        $_response = array();
        if ($_execute_cekuser_exist > 0) {
            $_response["message"] = trim("Username already exist! Try another username.");
            $_response["code"] = 400;
            $_response["status"] = false;

            echo json_encode($_response);
        } else {
            $_query_insert_new_user = "INSERT INTO tbl_signup
            (kode_user, namalengkap_user, telepon_user, tanggal_lahiruser, username_user, password_user, userakses)
            VALUES
            ('$kode_user', '$namalengkap_user', '$telepon_user', '$tanggal_lahiruser', '$username_user', '$password_user', '$userakses');";
            $_execute_register = mysqli_query($_AUTH, $_query_insert_new_user);

            $_query_cekuser_exist = mysqli_query($_AUTH, "SELECT * FROM tbl_signup WHERE username_user = '$username_user'");

            if ($_execute_register > 0) {
                $_response["newregister"] = array();

                while ($row = mysqli_fetch_array($_query_cekuser_exist)) {
                    $data = array();

                    $data["kode_user"] = $row["kode_user"];
                    $data["namalengkap_user"] = $row["namalengkap_user"];
                    $data["telepon_user"] = $row["telepon_user"];
                    $data["tanggal_lahiruser"] = $row["tanggal_lahiruser"];
                    $data["username_user"] = $row["username_user"];
                    $data["password_user"] = $row["password_user"];
                    $data["userakses"] = $row["userakses"];

                    $_response["message"] = trim("You have been registered.");
                    $_response["code"] = 200;
                    $_response["status"] = true;

                    array_push($_response["newregister"], $data);
                }
                echo json_encode($_response);
            } else {
                $_response["message"] = trim("Failed to registered.");
                $_response["code"] = 400;
                $_response["status"] = false;

                echo json_encode($_response);
            }
        }
    } else {
        $_response["message"] = trim("Forbiedden.");
        $_response["code"] = 400;
        $_response["status"] = false;

        echo json_encode($_response);
    }
?>