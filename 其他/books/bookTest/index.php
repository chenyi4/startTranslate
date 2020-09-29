<?php
   $json_string = file_get_contents('all.json'); 
   
   // 用参数true把JSON字符串强制转成PHP数组 
   $data = json_decode($json_string, true);

   //读取对方的ip并且保存下载数据

   //获取参数 查询 传参数据，满足books的数据值，如果存在就返回
   $all_param = file_get_contents("php://input");
   $get_param = json_decode($all_param, true)["args"];

   $res = file_get_contents("data/number.txt");
   $myfile = fopen("data/number.txt", "w") or die("Unable to open file!");
   fwrite($myfile,  ((int)$res+1));
   fclose($myfile);

   $type = ($get_param["value"]);
   if(!$type){
       //随机取小于20的值
        $back = null;
        if(count($data['books']) > 20){
            $back  = $data['books'];
        }else{
            //随机取20位的值
            $back = $data['books'];
        }
        exit (json_encode(["all"=>$back, 'visit'=>(int)$res]));
   }else{
        $allText = array();
        foreach($data['books'] as $key =>$v){
            if(strstr($v['name'],$type)){
                $allText[$key] = $v;
            }
        } 
        exit (json_encode(["all"=>$allText, 'visit'=>(int)$res]));
   }
   
   
   
   //如果传递的数据为空,就随机返回一些 

   //桌面上面的就获取20个，手机端就获取10条数据

//    echo $json_string;
//    exit (json_encode($data));
?>