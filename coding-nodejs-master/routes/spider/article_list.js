
var express = require('express')
var app = express()
var request = require('superagent')
var superagent=require('superagent-charset')(request)
var cheerio = require('cheerio')
var eventproxy = require('eventproxy')
var iconv = require('iconv-lite')
var async = require('async');

var kHost = 'https://www.zwdu.com'


// 当前并发数
var concurrencyCount = 0;
/**
 * 开启爬虫
 */
var startSpider = async ()=>{
  // 获取文章列表页
  var urls = await get_article_list_urls();
  var article_list = await get_article_list(urls);
  // 获取文章详情页
  var article_detail = get_detail_list(article_list[2]);
}
/**
 * 获取全本小说的urls
 */
var get_article_list_urls = ()=>{
  var urls = [];
  for (let i=1; i<=14; i++) {
    var url = i == 1 ? kHost + '/quanben/' : kHost + '/quanben/' + i + '.html'
    urls.push(url);
  }
  return urls;
}
/**
 * 获取每页小说列表
 * page: 页数
 */
var atricle_list = (url, callback)=>{
  superagent.get(url)
    .charset('gbk')
    .end((err, sres)=>{
    // 错误处理
    if (err) {
      console.log('有错误')
      // eject(err);
    }
    // 解析
    var $ = cheerio.load(sres.text);
    var items = [];
    $('.novelslist2 li').each((idx, element)=>{
      var $element = $(element);
      var type = $element.children().eq(0).children().eq(0).text();
      var name = $element.children().eq(1).text();
      var href = $element.children().eq(1).children().eq(0).attr('href');
      var chapter = $element.children().eq(2).text();
      var author = $element.children().eq(3).text();
      var time = $element.children().eq(4).text();
      var status = $element.children().eq(5).text();
      items.push({
        'type': type,
        'name': name,
        'href': kHost + href,
        'chapter': chapter,
        'author': author,
        'time': time,
        'status': status
      });
    });
    concurrencyCount--;
    callback(null, items);
  });
}
/**
 * 
 * @param {小说列表页数组} urls 
 */
var get_article_list = (urls)=>{
  return new Promise((resolve, reject) => {
    var datas = [];
    // 并发连接数的计数器
    async.mapLimit(urls, 3, (url, callback)=>{
      concurrencyCount++;
      console.log('现在的并发数是', concurrencyCount, '，正在抓取的是', url);
      atricle_list(url, callback);
    }, (err, result)=>{
      if (err) {
        reject(err);
      }
      console.log('final:');
      var results = [];
      for (let i=0; i<result.length; i++) {
        results.push(...result[i])
      }
      resolve(results);
    });
  })




  // var fetchUrl = async (urls, callback)=>{




  //   // delay 的值在 2000 以内，是个随机的整数
  //   var delay = parseInt((Math.random() * 10000000) % 2000, 10);
  //   concurrencyCount++;
  //   console.log('现在的并发数是', concurrencyCount, '，正在抓取的是', url, '，耗时' + delay + '毫秒');
  //   setTimeout(function () {
  //     concurrencyCount--;
  //     callback(null, url + ' html content');
  //   }, delay);
  // };

  // var urls = [];
  // for(var i = 0; i < 30; i++) {
  //   urls.push('http://datasource_' + i);
  // }

  // async.mapLimit(urls, 5, function (url, callback) {
  //   fetchUrl(url, callback);
  // }, function (err, result) {
  //   console.log('final:');
  //   console.log(result);
  // });
}
/**
 * 
 * @param {获取小说详情页} data 
 */
var get_detail_list = (data)=>{
  console.log(data);
}



module.exports = startSpider