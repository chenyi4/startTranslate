<?php
    $dir = dirname(__FILE__).'/allbooks';

    $filesnames = scandir($dir);

    $allArray = array();

    $jsons = '{ "books": [';
    
    foreach ($filesnames as $key =>$name) {
        if($name != '.'&&$name != '..'){
            $jsons = $jsons.'{"name":"'.$name.'"},';
            $allArray[count($allArray)] = $name;
        }
    }

    $myfile = fopen("all.json", "w") or die("Unable to open file!");
    $jsons = substr($jsons,0,strlen($jsons)-1);
    $jsons = $jsons.']}';
    fwrite($myfile,  $jsons);
    fclose($myfile);

    exit(json_encode($allArray));

?>