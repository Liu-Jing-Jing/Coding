
const express = require('express')
const app = express()
const Ut = require('../../../utils/common')
const myajax = require('../../../utils/axios_render');

var home_recommend = ()=> {
  return new Promise((resolve, reject)=> {
    var url = 'https://recommender-api-ms.juejin.im/v1/get_recommended_entry';
    var params = {
      'suid': '6yzq3j3ybZIAVuVqYVRj', 
      'ab': 'welcome_3', 
      'src': 'web'
    }
    myajax.get(url, {
      params: params
    }).then(function (response) {
      resolve(response['d']);
    })
    .catch((err)=>{
      eject(err);
    })
  });
}

module.exports = home_recommend

// app.get('/home_recommend', async (req, res)=>{
//   var url = 'https://recommender-api-ms.juejin.im/v1/get_recommended_entry';
//   var params = {
//     'suid': '6yzq3j3ybZIAVuVqYVRj', 
//     'ab': 'welcome_3', 
//     'src': 'web'
//   }
//   myajax.get(url, {
//     params: params
//   }).then(function (response) {
//     res.send(response);
//   })
//   .catch((err)=>{
//     console.log(err)
//   })

//   await Ut.sleep(2000);  
//   res.send(params);
// })

// module.exports = app
