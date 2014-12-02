<?php

session_start();
require_once 'configure.php';
require_once 'classes/database.class.php';
require_once 'classes/global.class.php';
require_once 'classes/mail.class.php';
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$http = 'http://';
if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == "on") {
    $http = 'https://';
}
$base_url = $http . $_SERVER['HTTP_HOST'] . '/kris';
$admin_url = $http . $_SERVER['HTTP_HOST'] . '/kris/myadmin';
define('PER_PAGE', 4);
?>