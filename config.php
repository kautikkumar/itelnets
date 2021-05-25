<?php

$conn = mysqli_connect("localhost", "itelnets", "itelnets@001", "itelnets");
          
// Check connection
if($conn === false){
    die("ERROR: Could not connect. " 
        . mysqli_connect_error());
}


