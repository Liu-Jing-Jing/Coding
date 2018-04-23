
const express = require('express')
const app = express()
const Ut = require('../../../utils/common');
const home_recommend = require('../juejin/home_recommend');

app.get('/home_list', async (req, res)=>{
  var recommend = await home_recommend();
  var params = {
    'retCode': 0,
    'retMessage': '请求成功',
    'ad': [
      {
        'image': 'http://localhost:3003/images/1.jpeg',
        'url': 'https://www.baidu.com'
      },
      {
        'image': 'http://localhost:3003/images/2.jpeg',
        'url': 'https://www.baidu.com'
      },
      {
        'image': 'http://localhost:3003/images/3.jpeg',
        'url': 'https://www.baidu.com'
      }
    ],
    'technical': [
      {
        'image': 'home_finish',
        'name': '文档社区'
      },
      {
        'image': 'home_practice',
        'name': '极客周边'
      },
      {
        'image': 'home_shopping',
        'name': '奇币商城'
      }
    ],
    'headlines': [
      '知乎专栏突破10000',
      '奇点日报齐逼商城兑换商品',
      '程序是怎样跑起来的'
    ],
    'recommend': recommend
  }
  
  await Ut.sleep(2000);  
  res.send(params);
})

module.exports = app
