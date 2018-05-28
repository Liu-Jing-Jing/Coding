import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
  TextInput,
  Image
} from 'react-native';
import { ScreenWidth, NavigationHeight, countcoordinatesX } from './Define';
import { ColorBg } from './ColorUtils';

/// 输入框
export default class KKTextInput extends Component {

  // 获取输入框
  getTextInput = ()=>{
    return this.refs.textInput;
  }
  // 是否显示图片
  isShowIcon = (imageStr)=>{
    if (imageStr != undefined) {
      return {
        width: 20
      }
    }
    else {
      return {
        width: 0
      }
    }
  }
  // 初始化
  render() {
    return (
      <View style={[this.props.prop_style, styles.container]}>
        <Image 
          style={[styles.icon, this.isShowIcon(this.props.leftImage)]}
          source={{uri: this.props.leftImage}}
        />
        <TextInput 
          ref={"textInput"}
          style={styles.input}
          placeholder={this.props.placeholder}
        />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  input: {
    flex: 1,
  },
  icon: {
    height: 20,
    marginLeft: countcoordinatesX(10),
    marginRight: countcoordinatesX(5),
  }
});
