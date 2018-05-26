import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
  TextInput,
  Image,
  ScrollView,
  Animated
} from 'react-native';
import { ScreenWidth, NavigationHeight, countcoordinatesX } from './Define';
import { ColorBg } from './ColorUtils';

// 子控件
class KKSegmentSubView extends Component {
  render() {
    return (
      <View style={styles.subview}>
        <Text style={[
          styles.text,
          {color: this.props.isChoose == true ? this.props.selectColor : this.props.normalColor}
        ]}>
          推荐
        </Text>
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

/// 输入框
export default class KKSegmentBar extends Component {

  // 子控件
  subview = ()=>{
    var arr = [];
    for (let i=0; i<10; i++) {
      arr.push(
        <KKSegmentSubView 
          key={i}
          isChoose={i==2}
          normalColor={"green"}
          selectColor={"red"}
        />
      )
    }
    return arr;
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
