
var express = require('express');
var app = express();
var {connectDB, createCollection, insertSomeData} = require('./mongodb');
var {songlist, songdetail, songcategory} = require('./api');

// 后台服务
var service = async ()=>{
    await connectDB();
    await createCollection("list")
    await createCollection("song")
    await insertSomeData();
    await startAPI();
}
// API
var startAPI = ()=>{
    app.use(express.static('public'));
    app.get('/songlist', songlist);
    app.get('/songdetail', songdetail);
    app.get('/songcategory', songcategory);
    app.listen(3000);
}

service();


