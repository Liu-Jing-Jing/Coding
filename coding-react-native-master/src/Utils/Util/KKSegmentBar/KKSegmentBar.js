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
import { ScreenWidth, NavigationHeight, countcoordinatesX, ColorBg } from '../../../Define/PublicMacros';

// 子控件
class KKSegmentSubView extends Component {

  // 获取frame
  getFrame = async ()=>{
    var frame = await new Promise((resolve, reject)=>{
      this.refs.view.measure((x, y, width, height, left, top)=>{
        resolve({
          x: x,
          y: y,
          width: width,
          height: height,
          left: left,
          top: top
        });
      })
    });
    return frame;
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
  // 初始值
  static defaultProps = {  
    // 横线宽度
    width: 20,
  } 
  // 设置选中
  setSelect = (frame)=>{
    var left = frame.left + frame.width / 2 - this.props.width / 2

  }

  // 初始化
  render() {
    return (
      <View style={[styles.line, {
        width: this.props.width,
        left: 10
      }]}/>
    )
  }
}
// 输入框
class KKSegmentBar extends Component {
  // 点击事件
  _onPress = async (index)=>{
    var frame = await this.refs["subview"+index].getFrame()
    await this.refs.line.setSelect(frame);
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
          <KKSegmentLine ref={"line"}/>
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
    height: 3,
    backgroundColor: 'orange',
    position: 'absolute',
    bottom: 2,
    borderRadius: 1.5,
  },
  // 文字
  text: {
    fontWeight: '700',
    color: 'white'
  }
});


export default KKSegmentBar;