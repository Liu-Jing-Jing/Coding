
const express = require('express')
const app = express()
const Ut = require('../../../utils/common');
const home_recommend = require('../juejin/home_recommend');

app.get('/article_list', async (req, res)=>{
  var recommend = await home_recommend();
  var params = {
    'retCode': 0,
    'retMessage': '请求成功',
    // 广告
    'ad': [
      {
        'image': 'http://localhost:3003/images/1.jpeg',
        'url': 'https://www.baidu.com'
      }
    ],
    // 技术点
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
    // 文章 
    'article': [
      {
        'icon': 'http://localhost:3003/images/recommend1.png',
        'name': '八阿哥',
        'time': '2天前',
        'category': [
          {
            'id': '123123',
            'name': 'iOS'
          },
        ],
        'type': 1,
        'image': 'http://localhost:3003/images/recommend1.png',
        // 标题
        'title': '优化 Xcode 编译时间',
        // 阅读次数
        'read': 28,
        // 评论
        'comment': 0,
        // 喜欢
        'like': 0,
      },
      {
        'icon': 'http://localhost:3003/images/recommend1.png',
        'name': '八阿哥',
        'time': '2天前',
        'category': [
          {
            'id': '123123',
            'name': 'iOS'
          },
        ],
        'type': 0,
        'image': 'http://localhost:3003/images/recommend1.png',
        // 标题
        'title': '优化 Xcode 编译时间',
        // 阅读次数
        'read': 28,
        // 评论
        'comment': 0,
        // 喜欢
        'like': 0,
      },
    ],
  }
  
  // await Ut.sleep(4000);  
  res.send(params);
})

module.exports = app
