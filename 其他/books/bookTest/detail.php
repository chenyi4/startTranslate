<?php
    $all_param = file_get_contents("php://input");
    $get_param = json_decode($all_param, true)["args"];
 
    $type = ($get_param["name"]);
    $all = $_SERVER['SERVER_ADDR'].':'.$_SERVER['SERVER_PORT'].'/'.'allbooks'.'/'.$type;

     exit(json_encode(["href"=>$all]));
?>