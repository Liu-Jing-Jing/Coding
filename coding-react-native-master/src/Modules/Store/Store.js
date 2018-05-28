import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
  ScrollView
} from 'react-native';
import NavigationBar from '../../Utils/Util/KKNavigationItem/NavigationBar';
import StoreSectionHeader from './StoreSectionHeader';
import StoreSummaryView from './StoreSummaryView';
import StoreCategoryView from './StoreCategoryView';
import StoreDetailView from './StoreDetailView';
import StoreBar from './StoreBar';
import { ScreenWidth, ScreenHeight, ColorBg } from '../../Define/PublicMacros';

export default class Store extends Component {
  render() {
    return (
      <View style={styles.container}>
        <View style={styles.bg}/>
        <StoreBar/>
        <ScrollView showsVerticalScrollIndicator={false}>
          <StoreSectionHeader/>
          <StoreSummaryView/>
          <StoreSectionHeader/>
          <StoreCategoryView/>
          <StoreSectionHeader/>
          <StoreDetailView/>
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
  bg: {
    width: ScreenWidth,
    height: ScreenHeight,
    top: -ScreenHeight / 2,
    backgroundColor: ColorBg,
    position: 'absolute',
  }
});
