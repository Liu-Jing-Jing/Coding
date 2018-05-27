import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
  TextInput,
  Image,
  ScrollView,
  Animated,
  TouchableOpacity
} from 'react-native';
import { ScreenWidth, NavigationHeight, countcoordinatesX } from './Define';
import { ColorBg } from './ColorUtils';

// 子控件
class KKSegmentSubView extends Component {


  prop_measure = async()=>{
    // var aaa = Promise(this.refs["view"].measure((x, y, width, height, left, top)=>{
    //   return width
    // }));
    const aaa = new Promise((resolve, reject)=>{
      if (true){
        resolve("AAAAAAA");
      } else {
        reject("BBBBBBB");
      }
    });
    aaa.then(value=>{
      console.log("value: " + value);
    })
  }

  render() {
    return (
        <View 
          style={styles.subview} 
          ref={"view"}
        >
          <TouchableOpacity 
            style={{justifyContent: 'center'}}
            onPress={this.props.onPress}
          >
            <Text style={[
              styles.text,
              {color: this.props.isChoose == true ? this.props.selectColor : this.props.normalColor}
            ]}>
              推荐
            </Text>
            </TouchableOpacity>
        </View>
    )
  }
}
// 底部那条线
class KKSegmentLine extends Component {
  // 初始化
  render() {
    return (
      <View style={styles.line}/>
    )
  }
}
// 输入框
export default class KKSegmentBar extends Component {
  // 点击事件
  _onPress = (index)=>{
    console.log(this.refs["subview"+index].prop_measure());
  }
  // 子控件
  subview = ()=>{
    let arr = [];
    for (let i=0; i<10; i++) {
      var refStr = "subview" + i + "";
      arr.push(
        <KKSegmentSubView 
          key={i}
          ref={refStr}
          isChoose={i==2}
          normalColor={"green"}
          selectColor={"red"}
          onPress={()=>this._onPress(i)}
        />
      )
    }
    return arr;
  }

  // 选中
  selectIndex = ()=>{

  }

  // 初始化
  render() {
    return (
      <View style={[this.props.prop_style, styles.container]}>
        <ScrollView 
          horizontal={true}
          showsHorizontalScrollIndicator={false}
        >
          {this.subview()}
          <KKSegmentLine/>
        </ScrollView>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  // 父控件
  container: {
    flex: 1,
  },
  // 子控件
  subview: {
    paddingLeft: 10,
    paddingRight: 10,
    justifyContent: 'center',
  },
  // 线条
  line: {
    width: 20,
    height: 3,
    backgroundColor: 'orange',
    position: 'absolute',
    bottom: 2,
    borderRadius: 1.5,
    left: 10,
  },
  // 文字
  text: {
    fontWeight: '700',
    color: 'white'
  }
});
