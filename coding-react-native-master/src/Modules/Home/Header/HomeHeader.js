import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
  Image,
  TouchableOpacity
} from 'react-native';
import {ScreenWidth, ThinBGColor, LightBGColor, countcoordinatesY, countcoordinatesX} from '../../../Public/Public';

export default class HomeHeader extends Component {
  render() {
    return (
      <View style={styles.container}>
        <View style={styles.line}/>
        <Text style={styles.name}>asdasd</Text>
        <TouchableOpacity>
          <Image style={styles.next}/>
        </TouchableOpacity>
      </View>
    );
  }
}

var styles = StyleSheet.create({
  container: {
    flexDirection: 'row',
    height: countcoordinatesY(45),
    backgroundColor: ThinBGColor,
    marginTop: countcoordinatesY(10),
    alignItems: 'center',
    paddingLeft: countcoordinatesX(15),
    paddingRight: countcoordinatesX(15),
  },
  line: {
    width: 2,
    height: 20,
    backgroundColor: 'red'
  },
  name: {
    marginLeft: countcoordinatesX(15),
    flex: 1,
  },
  next: {
    width: 20,
    height: 20,
    backgroundColor: 'red'
  }
})