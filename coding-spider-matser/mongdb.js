
var MongoClient = require('mongodb').MongoClient;
var url = "mongodb://localhost:27017/runoob";

// 链接数据库
var connectDB = ()=>{
    return new Promise((resolve, reject)=>{
        MongoClient.connect(url, (err, db)=> {
            if (err) {
                reject();
            }
            else {
                resolve();
            }
        });
    })
}

module.exports = {connectDB}

