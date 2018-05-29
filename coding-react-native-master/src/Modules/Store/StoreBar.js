import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
  TextInput,
  Image,
  Button
} from 'react-native';
import { ScreenWidth, countcoordinatesX, countcoordinatesY, ColorBg } from '../../Define/PublicMacros';
import KKTextInput from '../../Utils/Util/KKTextInput/KKTextInput';
import KKSegmentBar from '../../Utils/Util/KKSegmentBar/KKSegmentBar';
import KKButton, { ButtonStyle } from '../../Utils/Util/KKButton/KKButton';

export default class StoreBar extends Component {

  componentDidMount() {
    
  }
  // btn点击
  btnClick = (index)=>{
    this.refs.bar.btnClick(index);
  }
  render() {
    return (
      <View style={styles.container}>
        {/* 搜索栏 */}
        <KKTextInput 
          ref="textInput"
          prop_style={styles.input}
          placeholder={"搜索音乐"}
          onFocus={this.props.onFocus}
          leftImage={"search_in_12x12_"}
        />
        {/* 滚动条 + 按钮 */}
        <View style={styles.bottom}>
          {/* 滚动条 */}
          <KKSegmentBar 
            ref={"bar"}
            prop_style={styles.bar}
            onPress={this.props.onPress}
          />
          {/* 目录 */}
          <KKButton 
            icon={"btn_menu"}
            button_style={ButtonStyle.Left}
          />
        </View>
      </View>
    );
  }
}

const padding = countcoordinatesX(15);
const styles = StyleSheet.create({
  container: {
    width: ScreenWidth,
    backgroundColor: ColorBg,
    paddingLeft: padding,
  },
  input: {
    width: ScreenWidth - padding * 2,
    height: 35,
    backgroundColor: 'white',
    marginTop: 20,
    borderRadius: 3,
  },
  bottom: {
    width: ScreenWidth - padding,
    height: 30,
    flexDirection: 'row',
  },
  button: {

  }
});
