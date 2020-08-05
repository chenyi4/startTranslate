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
                $file = fopen($a, 'r');
                $content = '';
                $createtime = fileatime($a);
                while(!feof($file)){
                    $content .= fgets($file, 1024);
                }
                fclose($file);
                $currentArr[count($currentArr)] = [
                    "name" => $v,
                    "text" => true,
                    "src" => $a,
                    // "content" =>$content,
                    "createtime" => $createtime,
                    "trueTime" => date("Y-m-d H:i:s",$createtime)
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