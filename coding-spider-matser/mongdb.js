
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
// 创建集合
var createCollection = (data, err, res)=>{
    // 创建失败
    if (err) {
        console.log('创建集合失败');
    }
    // 创建成功
    else {
        console.log('创建集合 ' + data + ' 成功');
        _dbase = _db.db("runoob");
        _dbase.createCollection(data, (err, res)=>{
            // if (err) throw err;
            // _db.close();
        });
    }
}
// 添加数据
var insertDate = (base, data)=>{
    _dbase.collection(base).insertMany(data, (err, result)=>{  
        if (err) {  
            console.log('添加数据失败');
            return;  
        }  
        console.log('添加数据到 ' + base + ' 成功');
        _db.close();  
    });  
}


module.exports = {connectDB, insertDate, createCollection}

