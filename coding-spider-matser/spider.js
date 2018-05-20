

const request = require('request');
const async = require('async');

/**
 * #define NEW_SONG_LIST           1   新歌
 * #define HOT_SONG_LIST           2   热歌
 * #define OLD_SONG_LIST           22  经典
 * #define LOVE_SONG_LIST          23  情歌
 * #define INTERNET_SONG_LIST      25  网络
 * #define MOVIE_SONG_LIST         24  影视
 * #define EUROPE_SONG_LIST        21  欧美
 * #define BILLBOARD_MUSIC_LIST    8   Bill
 * #define ROCK_MUSIC_LIST         11  摇滚
 * #define JAZZ_MUSIC_LIST         12  爵士
 * #define POP_MUSIC_LIST          16  流行
 */

var listIds = [1, 2, 22, 23, 25, 24, 21, 8, 11, 12, 16];
// var listIds = [1, 2, 22];
var songIds = [];
// 列表数据
var lists = [];
// 歌曲数据
var songs = [];

// 获取列表
var getList = (id, page, list, complete)=>{
    var _page = page == undefined ? 0 : page;
    var _id = id == undefined ? 1 : id;
    var url = "http://tingapi.ting.baidu.com/v1/restserver/ting?from=qianqian&version=2.1.0&method=baidu.ting.billboard.billList&format=json&type=" + _id + "&offset=0&size=20&page=" + _page;
    request(url, function (error, response, body) {
        // 成功
        if (!error && response.statusCode == 200) {
            var json = JSON.parse(body);
            // 有数据
            if (json && json.song_list != null) {
                // 还有下一页
                if (page <= 4 || json.song_list.length != 0) {
                    // 列表数据
                    list.push(...json.song_list);
                    // 歌曲id
                    for (var i=0; i<json.song_list.length; i++) {
                        var data = json.song_list[i];
                        songIds.push(data.song_id);
                    }
                    console.log('爬虫成功, id: ' + _id + ' url: ' + url);
                    getList(_id, _page + 1, list, complete);
                }
                // 最后一页
                else {
                    console.log('爬虫最后一页, id: ' + _id + ' url: ' + url);
                    complete({[_id]: list});
                }
            }
            // 无数据
            else {
                console.log('爬虫无数据, id: ' + _id + ' url: ' + url);
                complete({[_id]: list});
            }
        } 
        // 失败
        else {
            console.log('爬虫失败, id: ' + _id + ' url: ' + url);
            complete({[_id]: list});
        }
    })
}
var getListData = ()=>{
    return new Promise((resolve, reject)=>{
        // 获取歌曲列表
        async.mapLimit(listIds, 2, (id, callback)=>{
            getList(id, 1, [], (datas)=>{
                lists.push(datas);
                callback(null, datas);
            });
        },(err, result)=>{
            resolve(result);
        });
    })
}
// 获取详细歌的信息
var getSong = (id, callback)=>{
    // 具体歌的地址
    var url = "http://tingapi.ting.baidu.com/v1/restserver/ting?from=qianqian&version=2.1.0&method=baidu.ting.song.play&songid=" + id;
    request(url, (error, response, body)=>{
        // 成功
        if (!error && response.statusCode == 200) {
            var data = JSON.parse(body);
            songs.push(data);
            callback(data);
        }
        // 失败
        else {
            callback();
        }
    })
}
var getSongData = ()=>{
    return new Promise((resolve, reject)=>{
        // 获取歌曲列表
        async.mapLimit(songIds, 2, (id, callback)=>{
            getSong(id, (datas)=>{
                callback(null, {[id]: datas});
            });
        },(err, result)=>{
            resolve(result);
        });
    })
}
// 开始监听
var startSpider = async ()=>{
    await getListData();
    await getSongData();
    return {'list': lists, 'song': songs};
}
module.exports = {startSpider}
