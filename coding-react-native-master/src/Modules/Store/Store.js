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
import KKEmptyView from '../../Utils/Util/KKEmptyView/KKEmptyView';
import { ScreenWidth, ScreenHeight, ColorBg } from '../../Define/PublicMacros';

export default class Store extends Component {
  render() {
    return (
      <View style={styles.container}>
        <StoreBar/>
        <StoreScroll/>
        <KKEmptyView/>
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
