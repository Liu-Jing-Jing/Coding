
var express = require('express');
var app = express();
var {readSongData, readListData} = require('./mongodb');
var {loadCache, saveCache} = require('./cache');

// 歌曲列表
var songlist = async (req, res)=>{
    // 数据
    var page = req.query.page;
    var number = req.query.number;
    page = page == undefined ? 0 : parseInt(page - 1);
    number = number == undefined ? 20 : parseInt(number);
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
}
// 歌曲详情
var songdetail = async (req, res)=>{
    // 数据
    var songid = req.query.songid;
    songid = songid == undefined ? 0 : songid;
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
}
// 歌曲分类
var songcategory = async (req, res)=>{
    // 暂空
}

module.exports = {
    songlist,
    songdetail,
    songcategory
}
