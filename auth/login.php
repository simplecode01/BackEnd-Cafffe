<?php
    include '../config/connection.php';

    if ($_SERVER['REQUEST_METHOD'] == 'POST') {

        if (trim($_POST['username_user']) == "") {
            $_response["message"] = trim("Fill your username in here.");
            $_response["code"] = 400;
            $_response["status"] = false;

            echo json_encode($_response);
        } else if (trim($_POST['password_user']) == "") {
            $_response["message"] = trim("Fill your password in here.");
            $_response["code"] = 400;
            $_response["status"] = false;

            echo json_encode($_response);
        } else {
            $username_user = trim($_POST['username_user']);
            $password_user = trim($_POST['password_user']);

            $querysearch_user = mysqli_query($_AUTH, "SELECT * FROM tbl_signup WHERE username_user = '$username_user' AND password_user = '$password_user'");
            $_response = array();
            $execute_querylogin = mysqli_num_rows($querysearch_user);

            if ($execute_querylogin > 0) {
                $_response["loginact"] = array();

                while ($row = mysqli_fetch_array($querysearch_user)) {
                    $fetch_datauser = array();

                    $fetch_datauser["kode_user"] = $row["kode_user"];
                    $fetch_datauser["namalengkap_user"] = $row["namalengkap_user"];
                    $fetch_datauser["telepon_user"] = $row["telepon_user"];
                    $fetch_datauser["tanggal_lahiruser"] = $row["tanggal_lahiruser"];
                    $fetch_datauser["username_user"] = $row["username_user"];
                    $fetch_datauser["password_user"] = $row["password_user"];
                    $fetch_datauser["userakses"] = $row["userakses"];
                    $fetch_datauser["tanggalregister"] = $row["tanggalregister"];

                    $_response["message"] = trim("Login successfully.");
                    $_response["code"] = 200;
                    $_response["status"] = true;

                    array_push($_response["loginact"], $fetch_datauser);
                }
                echo json_encode($_response);
            } else {
                $_response["message"] = trim("Login failed. Check your Username & Password Again.");
                $_response["code"] = 400;
                $_response["status"] = false;
                echo json_encode($_response);
            }
        }
    } else {
        $_response["message"] = trim("Forbidden.");
        $_response["code"] = 403;
        $_response["status"] = false;
        echo json_encode($_response);
    }
?>