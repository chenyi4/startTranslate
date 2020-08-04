<?php
    $temp = dirname(__FILE__).'/all';
    $fileName = scandir($temp);

    function getDetailFile($fileName, $temp){
        $currentArr = array();
        foreach($fileName as $v){
            if($temp != null){
                $a = $temp.'/'.$v;
            }else{
                $a = $v;
                
            }
            if(strstr($a, '.txt')){
                $currentArr[count($currentArr)] = [
                    "name" => $v,
                    "text" => true
                ];
            }
            if(is_dir($a)){
                if($v=='.' || $v=='..'){
                    continue;
                }
                $currentArr[count($currentArr)] = [
                    "name" => $v,
                    "src"=>$a,
                    "file" => true,
                    "children" => setAll($a)
                ];
            }
        }
        return $currentArr;
    }
    function setAll($temp){
        // var_dump($temp);
        $fileName = scandir($temp);
        $back = getDetailFile($fileName, $temp);
        return $back;
    }
    
    $all = getDetailFile($fileName, $temp);

    $back = array();
    $back =  ["code" => 1, "data" => $all];
    exit(json_encode($all));
?>

<!-- http://localhost:8082/ -->