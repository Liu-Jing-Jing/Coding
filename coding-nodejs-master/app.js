var express = require('express')
var app = express()
var superagent = require('superagent')
var cheerio = require('cheerio')
var eventproxy = require('eventproxy')
const myajax = require('./utils/axios_render')

const home_list = require('./routes/api/myapp/home_list');
const article_list = require('./routes/api/myapp/article_list');
const discovery_list = require('./routes/api/myapp/discovery_list');
// const home_recommend = require('./routes/api/juejin/home_recommend');

app.use(express.static('public'));
app.get('/home_list', home_list);
app.get('/article_list', article_list);
app.get('/discovery_list', discovery_list);
// app.get('/home_recommend', home_recommend);

 
app.get('/', (req, res) => {
  var url = 'https://timeline-merger-ms.juejin.im/v1/get_tag_entry';
  var params = {
    'src': 'web', 
    'tagId': '555e99ffe4b00c57d99556aa', 
    'page': '2', 
    'pageSize': '20', 
    'sort': 'rankIndex'
  }
  myajax.get(url, {
    params: params
  }).then(function (response) {
    res.send(response);
  })
  .catch((err)=>{
    console.log(err)
  })


  // superagent.get('https://juejin.im/tag/React.js')
  //   .end(function (err, sres) {
  //     // 常规的错误处理
  //     if (err) {
  //       return next(err);
  //     }
  //     // sres.text 里面存储着网页的 html 内容，将它传给 cheerio.load 之后
  //     // 就可以得到一个实现了 jquery 接口的变量，我们习惯性地将它命名为 `$`
  //     // 剩下就都是 jquery 的内容了
  //     var $ = cheerio.load(sres.text);
  //     var items = [];
  //     $('.entry-list .title').each(function (idx, element) {
  //       var $element = $(element);
  //       items.push({
  //         title: $element.text(),
  //         href: $element.attr('href')
  //       });
  //     });
  //     res.send(items);
  //   });
})
 
app.listen(3003)