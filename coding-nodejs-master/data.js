
var MongoClient = require('mongodb').MongoClient;
var url = "mongodb://localhost:27017/runoob";

var _db;
var _dbase;


  

// 链接数据库
var connectDB = ()=>{
    return new Promise((resolve, reject)=>{
        MongoClient.connect(url, (err, db)=> {
            // 连接失败
            if (err) {
                console.log('连接数据库失败');
                reject(false);
            }
            // 连接成功
            else {
                _db = db;
                console.log('连接数据库成功');
                resolve(true);
            }
        });
    })
}
// 读取列表
var readListData = (page, number)=>{
    page = page == undefined ? 0 : parseInt(page - 1);
    number = number == undefined ? 20 : parseInt(number);
    return new Promise((resolve, reject)=>{
        _dbase = _db.db("runoob");
        var cursor = _dbase.collection('list').find().skip(page * number).limit(number);
        var arr = [];
        cursor.each((err, doc)=>{
            if (err) {
                reject(arr);
            }
            if (doc != null) {
                arr.push(doc);
            } else {
                resolve(arr);
            }
        });
    })
}
// 读取歌曲
var readSongData = (songId)=>{
    songId = songId == undefined ? 0 : songId;
    return new Promise((resolve, reject)=>{
        _dbase = _db.db("runoob");
        var cursor = _dbase.collection('song').find({id: songId})
        var data;
        cursor.each((err, doc)=>{
            if (err) {
                data = {'retCode': 1, 'retMessage': '哈哈哈'};
                reject(data);
            }
            if (doc != null) {
                data = doc;
            }
            else {
                if (data == undefined) {
                    data = {'retCode': 1, 'retMessage': '哈哈哈'};
                }
                resolve(data);
            }
        });
    })
}



module.exports = {connectDB, readListData, readSongData}