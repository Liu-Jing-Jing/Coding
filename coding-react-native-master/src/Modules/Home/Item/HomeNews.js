import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
  Image,
  TouchableOpacity
} from 'react-native';
import {ScreenWidth, ThinBGColor, LightBGColor, countcoordinatesX, countcoordinatesY} from '../../../Public/Public';


class HomeNewsItem extends Component {
  render() {
    return (
      <View style={[styles.item, {width: this.props.width}]}>
        <Image style={styles.icon}/>
        <Text style={styles.name}>123123</Text>
      </View>
    )
  }
}

export default class HomeNews extends Component {
  render() {
    return (
      <View style={styles.container}>
        <HomeNewsItem width={ScreenWidth - countcoordinatesY(15) * 2}/>
        <HomeNewsItem width={(ScreenWidth - countcoordinatesX(15) * 3) / 2}/>
        <HomeNewsItem width={(ScreenWidth - countcoordinatesX(15) * 3) / 2}/>
      </View>
    );
  }
}

var styles = StyleSheet.create({
  container: {
    flexDirection: 'row',
    backgroundColor: LightBGColor,
    flexWrap: 'wrap',
    paddingBottom: countcoordinatesY(15)
  },
  item: {
    width: (ScreenWidth - countcoordinatesX(15) * 3) / 2,
    height: 100,
    backgroundColor: 'red',
    marginLeft: countcoordinatesX(15),
    marginTop: countcoordinatesY(15)
  },
  icon: {
    flex: 2,
    backgroundColor: 'yellow'
  },
  name: {
    flex: 1,
    backgroundColor: 'orange'
  }
})