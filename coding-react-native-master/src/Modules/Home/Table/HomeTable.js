import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
  FlatList,
  ActivityIndicator,
} from 'react-native';
import PullRefreshScrollView from 'react-native-pullrefresh-scrollview';
import HomeCell from './HomeCell';


const REQUEST_URL = 'https://api.github.com/search/repositories?q=javascript&sort=stars&page=';
let pageNo = 1;//当前第几页
let totalPage=5;//总的页数
let itemNo=0;//item的个数

export default class HomeTable extends Component {

  constructor(props) {
    super(props);
    this.state = {
        isLoading: true,
        //网络请求状态
        error: false,
        errorInfo: "",
        dataArray: [{}],
        showFoot:0, // 控制foot， 0：隐藏footer  1：已加载完成,没有更多数据   2 ：显示加载中
        isRefreshing:false,//下拉控制
    }
  }

  //网络请求——获取第pageNo页数据
  fetchData(pageNo) {
    //这个是js的访问网络的方法
    fetch(REQUEST_URL+pageNo)
        .then((response) => response.json())
        .then((responseData) => {
            let data = responseData.items;
            let dataBlob = [];
            let i = itemNo;

            data.map(function (item) {
                dataBlob.push({
                    key: i,
                    value: item,
                })
                i++;
            });
            itemNo = i;
            console.log("itemNo:"+itemNo);
            let foot = 0;
            if(pageNo>=totalPage){
                foot = 1;//listView底部显示没有更多数据了
            }

            this.setState({
                //复制数据源
                dataArray:this.state.dataArray.concat(dataBlob),
                isLoading: false,
                showFoot:foot,
                isRefreshing:false,
            });
            data = null;
            dataBlob = null;
        })
        .catch((error) => {
            this.setState({
                error: true,
                errorInfo: error
            })
        })
        .done();
}


  onRefresh(PullRefresh) {
    setTimeout(() => {
      PullRefresh.onRefreshEnd();
    }, 1000);
  }

  _renderFooter(){
    if (this.state.showFoot === 1) {
        return (
            <View style={{height:30,alignItems:'center',justifyContent:'flex-start',}}>
                <Text style={{color:'#999999',fontSize:14,marginTop:5,marginBottom:5,}}>
                    没有更多数据了
                </Text>
            </View>
        );
    } else if(this.state.showFoot === 2) {
        return (
            <View style={styles.footer}>
                <ActivityIndicator />
                <Text>正在加载更多数据...</Text>
            </View>
        );
    } else if(this.state.showFoot === 0){
        return (
            <View style={styles.footer}>
                <Text>123123</Text>
            </View>
        );
    }
}

  _onEndReached() {
    //如果是正在加载中或没有更多数据了，则返回
    if(this.state.showFoot != 0 ){
        return ;
    }
    //如果当前页大于或等于总页数，那就是到最后一页了，返回
    if((pageNo!=1) && (pageNo>=totalPage)){
        return;
    } else {
        pageNo++;
    }
    //底部显示正在加载更多数据
    this.setState({showFoot:2});
    //获取数据
    this.fetchData( pageNo );
  }

  render() {
    return (
      <View style={styles.container}>
        <FlatList
          //data={this.state.dataArray}
          data={[{'key':'a'}]}
          renderItem={({item}) => <HomeCell/>}
          showsVerticalScrollIndicator={false}
          ListHeaderComponent={this.props.header}
        //   ListFooterComponent={()=>this._renderFooter()}
        //   onEndReached={()=>this._onEndReached()}
          renderScrollComponent={(props) => 
            <PullRefreshScrollView onRefresh={(PullRefresh)=>this.onRefresh(PullRefresh)} {...props}     
          />}
        />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: 'white',
  },
  table: {
    backgroundColor: 'red',
  }
});
