import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View
} from 'react-native';
import KKNavigationItem from './KKNavigationItem';
import { ScreenWidth, NavigationHeight, StatusBarHeight, countcoordinatesX } from './Define';
import { ColorBg } from './ColorUtils';

export default class NavigationBar extends Component {

  render() {
    return (
      <View style={styles.container}>
        <View style={styles.content}>
          <KKNavigationItem/>
          <Text style={styles.title}>asdasd</Text>
          <KKNavigationItem/>
        </View>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    width: ScreenWidth, 
    height: NavigationHeight(),
    backgroundColor: ColorBg,
  },
  content: {
    width: ScreenWidth,
    height: 44,
    marginTop: StatusBarHeight(),
    alignItems: 'center',
    justifyContent: 'space-between',
    flexDirection: 'row',
    paddingLeft: 10,
    paddingRight: 10,
  },
  title: {
    color: 'white',
    fontSize: 20,
  }
});
