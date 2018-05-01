var express = require('express')
var app = express()
var cheerio = require('cheerio')
var eventproxy = require('eventproxy')
const myajax = require('./utils/axios_render')
var iconv = require('iconv-lite')


const home_list = require('./routes/api/home_list');
const article_list = require('./routes/api/article_list');
const discovery_list = require('./routes/api/discovery_list');

const spider = require('./routes/spider/spider');
// const home_recommend = require('./routes/api/juejin/home_recommend');

app.use(express.static('public'));
app.get('/home_list', home_list);
app.get('/article_list', article_list);
app.get('/discovery_list', discovery_list);
// app.get('/home_recommend', home_recommend);


spider();


// app.get('/spider', async (req, res)=>{
//     var spider = await atricle_list();
//     res.send(spider);
// });

 
// app.listen(3003)