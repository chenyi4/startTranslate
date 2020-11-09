const fs = require('fs');
const express = require('express');
const app = express();
const port = 3000


app.get('/getHomeList', (req, res) => {
    const num = req.query.num;
    fs.readFile("./alldatas/allArticle.json", function(err, data) {
        var allData = JSON.parse(data);
        allData.sort((a, b) => {
            return Number(b.data) - Number(a.data)
        });
        var newArr = [];
        allData = allData.splice(0, num);
        if(num == 6){
            allData.forEach((item) => {
                item.content = item.content.splice(0, 300);
                newArr.push(item); 
            });
        }else{
            newArr = allData;
        }
        res.send(newArr);
    });
});

app.get('/getAllArticleList', (req, res) => {
    fs.readFile("./alldatas/allList.json", function(err, data) {
        var allData = JSON.parse(data);
        res.send(allData);
    });
});

app.get('/getArticle', (req, res) =>{
    const chunk = req.query.chunk;
    var article = {};
    fs.readFile("./alldatas/allArticle.json", function(err, data) {
        var allData = JSON.parse(data);
        allData.forEach((item) => {
            if(Number(item.chunk) == Number(chunk)){
                article = item;
            }
        });
        res.send(article);
    });
});


app.listen(port, () => console.log(`Example app listening on port ${port}!`))