<?php 
session start();

$con=mysqli_connect("database-1.cmeydtszbdvp.us-east-1.rds.amazonaws.com","hotel","rsidm2g1","hotel");

define('SERVER_PATH',$_SERVER['DOCUMENT_ROOT'].'/Hotel-Management-System-Ajax-PHP-Mysql-master/');
define('SITE_PATH','http://54.89.75.7/Hotel-Management-System-Ajax-PHP-Mysql-master/');


//$server="localhost";
//$username="root";
//$password="";
//$dbname="hotel";
//$con = mysqli_connect($server,$username,$password,$dbname);

if (!$con) {
  die("Connection failed: " . mysqli_connect_error());
}



?>
