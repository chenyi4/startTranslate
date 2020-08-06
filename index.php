<?php
    $temp = dirname(__FILE__).'/all';
    $fileName = scandir($temp);
    
    $all_param = file_get_contents("php://input");
    $get_param = json_decode($all_param, true)["args"];

    $type = ($get_param["type"]);
    $allText = array();

    $all = getDetailFile($fileName, $temp, "");
    /**
     * type=""
     * num = 1
     */
    if($type == "phone-index"||$type == "table-index"){
        $number = $get_param["num"];
        foreach($GLOBALS["allText"] as $key =>$v){
                foreach($GLOBALS["allText"] as $keyi =>$vi){
                    if($v["createtime"] < $vi["createtime"]){
                        $change =  $GLOBALS["allText"][$key];
                        $GLOBALS["allText"][$key] = $vi;
                        $GLOBALS["allText"][$keyi] = $change;
                    }
                }
        }
        $GLOBALS["allText"] = array_reverse($GLOBALS["allText"]); 
        exit(json_encode(array_slice($GLOBALS["allText"],0,($number?$number:5))));
        return false;
        /** type == 'all' */
    }else if($type == "all"){
        exit(json_encode($all));
        return false;
    }
    else if($type == "detail"){
        //type = "detail
        // $src = "D:\chenyi\git\startTranslate/all/苏珊米勒/learn/10大行星/JUPITER.txt";
        $src = $get_param["src"];
        $srctest =  $temp.'/'.$get_param["src"];
        $file = fopen($srctest, 'r');
        $content = '';
        while(!feof($file)){
            $content .= fgets($file, 1024);
        }
        fclose($file);
        $orgin = "";
        foreach($GLOBALS["allText"] as $key =>$v){
            if($v["src"] == $src){
                $orgin = $v;
            }
        }
        exit(
            json_encode(array(
                "orgin" => $orgin,
                "content" =>($content),
                "code"=>0
                ))
        );
        return false;
    }


    function getDetailFile($fileName, $temp, $name){
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
                    "name" => cutName($v),
                    "text" => true,
                    "src" => cutSrc(srcChange($a)),
                    "parent" => $name?$name:"无",
                    "createtime" => $createtime,
                    "trueTime" => date("Y-m-d H:i:s",$createtime)
                ];
                $GLOBALS["allText"][count($GLOBALS["allText"])] = [
                    "trueTime" => date("Y-m-d H:i:s",$createtime),
                    "createtime" => $createtime,
                    "name" => cutName($v),
                    "text" => true,
                    "src" => cutSrc(srcChange($a)),
                    "descript" => substr($content,0,250),
                    "parent" => $name?$name:"无"
                ];
               
            }
            if(is_dir($a)){
                if($v=='.' || $v=='..'){
                    continue;
                }
                $currentArr[count($currentArr)] = [
                    "name" => $v,
                    "src"=>cutSrc(srcChange($a)),
                    "file" => true,
                    "children" => setAll($a,$v)
                ];
            }
        }
        return $currentArr;
    }
    function srcChange($src){
        return preg_replace('/\\\\/','/',$src);
    }

    function cutSrc($src){
        $temp = srcChange($GLOBALS["temp"]);
        // $sre = 'D\:\/';
        return str_replace($temp,'',$src);
        // return $src;
    }

    function cutName($src){
        return preg_replace('/\.txt/','',$src);
    }

    function setAll($temp, $name){
        // var_dump($temp);
        $fileName = scandir($temp);
        $back = getDetailFile($fileName, $temp, $name);
        return $back;
    }
    // $back = array();
    // $back =  ["code" => 1, "data" => $all];
    // exit(json_encode($all));
?>

<!-- http://localhost:8082/ -->