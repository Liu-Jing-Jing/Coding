import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
  ScrollView
} from 'react-native';
import StoreBar from './StoreBar';
import StoreScroll from './StoreScroll';
import Search from '../Search/Search';
import { ScreenWidth, ScreenHeight, ColorBg } from '../../Define/PublicMacros';

export default class Store extends Component {

  // Btn点击
  _onBarPress = (index)=>{
    this.refs.scroll.setScrollTo(index)
  }
  // Scroll滚动完
  _onScrollEnd = (page)=>{
    this.refs.bar.btnClick(page)
  }
  // 搜索框成为焦点
  _onFocus = ()=>{
    console.log('onFocus')
  }
  render() {
    return (
      <View style={styles.container}>
        <StoreBar 
          ref={"bar"} 
          onPress={this._onBarPress}
          onFocus={this._onFocus}
        />
        <StoreScroll ref={"scroll"} onMomentumScrollEnd={this._onScrollEnd}/>
        <Search/>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'flex-start',
    alignItems: 'flex-start',
    backgroundColor: '#F5FCFF',
  }
});
