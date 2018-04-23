import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
} from 'react-native';
import HomeSwiper from './Item/HomeSwiper';
import HomeHeader from './Header/HomeHeader';
import HomeSectionFooter from './Footer/HomeSectionFooter';
import HomeTechnical from './Item/HomeTechnical';
import HomeCategory from './Item/HomeCategory';
import HomeNews from './Item/HomeNews';
import HomeTable from './Table/HomeTable';
import { ScreenWidth, countcoordinatesY } from '../../Public/Public';


class Header extends Component {
  render() {
    return (
      <View>
        <HomeSwiper/>
        <HomeTechnical/>
        <HomeHeader/>
        <HomeCategory/>
        <HomeSectionFooter/>
        <HomeHeader/>
        <HomeNews/>
        <HomeHeader/>
      </View>
    )
  }
}

export default class Home extends Component {

  render() {
    return (
      <View style={styles.container}>
        <HomeTable header={<Header/>}/>
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
