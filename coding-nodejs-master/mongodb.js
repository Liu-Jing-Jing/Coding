
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
    return new Promise((resolve, reject)=>{
        // 创建失败
        if (err) {
            console.log("创建合集: " + data + " 失败")
            reject();
        }
        // 创建成功
        else {
            console.log("创建合集: " + data + " 成功")
            _dbase = _db.db("runoob");
            _dbase.createCollection(data, (err, res)=>{
                resolve();
            });
        }
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
var readSongData = (songid)=>{
    songid = songid == undefined ? 0 : songid;
    return new Promise((resolve, reject)=>{
        _dbase = _db.db("runoob");
        var cursor = _dbase.collection('song').find({songid: parseInt(songid)})
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
// 添加数据
var insertDate = (base, data)=>{
    return new Promise((resolve, reject)=>{
        _dbase.collection(base).insertMany(data, (err, result)=>{ 
            if (err) {  
                console.log('添加数据 ' + base + '失败');
                reject();
            } 
            else {
                console.log('添加数据 ' + base + ' 成功');
                resolve();
            }
        });  
    });
}
// 写假数据
var insertSomeData = ()=>{
    return new Promise(async (resolve, reject)=>{
        await insertDate("list", [
            {
                id: 1,
                list: [
                    {
                        songId: 11,
                        title: "两只老虎"
                    }
                ]
            },
            {
                id: 2,
                list: [
                    {
                        songId: 12,
                        title: "三只松鼠"
                    }
                ]
            }
        ]);
        await insertDate("song", [
            {
                songid: 11,
                title: "两只老虎",
                icon: "两只老虎_icon"
            },
            {
                songid: 12,
                title: "三只松鼠",
                icon: "三只松鼠_icon"
            }
        ]);
    })
}


module.exports = {
    connectDB, 
    createCollection,
    readListData, 
    readSongData, 
    insertSomeData
}