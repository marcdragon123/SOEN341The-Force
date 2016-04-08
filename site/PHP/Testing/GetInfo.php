<?php
include "../functions.php";
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$con = getCon();

$user = accessPost('user');
$fname = accessPost('fname');
$lname = accessPost('lname');
$password = accessPost('pass');

if($GLOBALS['passchange'] == true){
    $sql = "update Student set password = password('".$password."') where FirstName = ".$fname." and LastName = ".$lname;
    $result = $con->query($sql);
    phpAlert("Password has been updated.");   
}

































?>