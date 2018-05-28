import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
  ScrollView
} from 'react-native';
import StoreSectionHeader from './StoreSectionHeader';
import StoreSummaryView from './StoreSummaryView';
import StoreCategoryView from './StoreCategoryView';
import StoreDetailView from './StoreDetailView';
import { ScreenWidth, ScreenHeight, ColorBg } from '../../Define/PublicMacros';

export default class StoreScroll extends Component {
  subview() {
    var arr = [];
    for (let i=0; i<10; i++) {
      arr.push(
        <ScrollView 
          showsVerticalScrollIndicator={false}
          style={styles.scroll}
        >
          <StoreSectionHeader/>
          <StoreSummaryView/>
          <StoreSectionHeader/>
          <StoreCategoryView/>
          <StoreSectionHeader/>
          <StoreDetailView/>
        </ScrollView>
      )
    }
    return arr;
  }
  render() {
    return (
      <View style={styles.container}>
        <ScrollView 
          horizontal={true} 
          pagingEnabled={true}
          style={{backgroundColor: ColorBg}}
        >
          {this.subview()}
        </ScrollView>
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
  },
  scroll: {
    // width: ScreenWidth,
    // height: ScreenHeight,
    // top: -ScreenHeight / 2,
    backgroundColor: ColorBg,
    // position: 'absolute',
  }
});
