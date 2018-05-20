
var express = require('express');
var app = express();

app.listen('/', (req, res)=>{
    res.write('哈哈哈啊');
});

app.listen(3000);