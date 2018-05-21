
var redis = require('redis');
var client = redis.createClient('6379', '127.0.0.1');

// 取数据
var loadCache = (key, callback)=>{
    // 取
    client.hgetall(key, (err, object)=>{
        callback(object);
    })
}
// 存数据
var saveCache = (key, data, callback, errback)=>{
    // 存
    client.hmset(key, data, (err)=>{
        if (err) {
            errback(err);
        } else {
            callback();
        }
    })
}

module.exports = {loadCache,saveCache};