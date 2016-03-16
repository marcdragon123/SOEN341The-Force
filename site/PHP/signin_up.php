<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
include 'functions.php';


$reason = $_POST["reason"];

var_dump($_POST);

if ($reason == 'signin'){
	signIn();
}else if($reason == 'signup'){
	signUp();
}

?>