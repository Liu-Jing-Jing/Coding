
var express = require('express');
var app = express();
var {connectDB, createCollection, insertSomeData, readSongData, readListData} = require('./mongodb');
var {loadCache, saveCache} = require('./cache');

// 歌曲列表
app.get('/songlist', async (req, res)=>{
    // 数据
    var page = req.query.page;
    var number = req.query.number;
    // 从缓存读取
    var key = 'songlist' + '_' + page + '_' + number;
    loadCache(key, async (data)=>{
        // 有缓存
        if (data != null) {
            console.log('通过缓存');
            res.send(JSON.parse(data.data));
        } 
        // 没有缓存, 从数据库
        else {
            console.log('通过数据库');
            var data = await readListData(page, number);
            // 有数据, 加入到缓存
            if (data != undefined && data.length != 0) {
                // 存值
                saveCache(key, {data: JSON.stringify(data)}, ()=>{
                    console.log('加入缓存成功');
                });
            }
            await res.send(data);
        }
    })
})
// 歌曲详情
app.get('/songdetail', async (req, res)=>{
    // 数据
    var songid = req.query.songid;
    // 读取数据
    var data = await readSongData(songid);
    // 从缓存读取
    var key = 'songdetail' + '_' + songid;
    loadCache(key, async (data)=>{
        // 有缓存
        if (data != null) {
            console.log('通过缓存');
            res.send(JSON.parse(data.data));
        }
        // 没有缓存, 从数据库
        else {
            console.log('通过数据库');
            var data = await readSongData(songid);
            // 有数据, 加入到缓存
            if (data != undefined && data.length != 0) {
                saveCache(key, {data: JSON.stringify(data)}, ()=>{
                    console.log('写入缓存成功');
                });
            }
            await res.send(data);
        }
    });
})
// 歌曲分类
app.get('/songcategory', async (req, res)=>{
    // 暂空
})
app.listen(3000)

// 开启后台服务
var service = async ()=>{
    await connectDB();
    await createCollection("list")
    await createCollection("song")
    await insertSomeData();
}
service();


