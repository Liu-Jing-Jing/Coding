import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
  Image,
  TouchableOpacity
} from 'react-native';
import {ScreenWidth, ThinBGColor, LightBGColor, countcoordinatesY, countcoordinatesX, MediumBGColor, BoldBGColor, HeavyBGColor} from '../../../Public/Public';

export default class HomeCell extends Component {
  render() {
    return (
      <View style={styles.container}>
        <Image style={styles.icon}/>
        <View style={styles.right}>
          <Text style={styles.name}>asd</Text>
          <View style={styles.bottom}>
            <Image style={styles.eye}/>
            <Text style={styles.number}>123</Text>
            <Text style={styles.tag}>#其他</Text>
          </View>
        </View>
      </View>
    );
  }
}

var styles = StyleSheet.create({
  container: {
    flexDirection: 'row',
    backgroundColor: LightBGColor,
    height: ScreenWidth / 4,
    paddingLeft: countcoordinatesX(15),
    paddingRight: countcoordinatesX(15),
    paddingTop: countcoordinatesY(10),
    paddingBottom: countcoordinatesY(10),
  },
  icon: {
    backgroundColor: MediumBGColor,
    flex: 1,
  },
  right: {
    flex: 2,
    backgroundColor: MediumBGColor,
    justifyContent: 'flex-start',
    flexDirection: 'column',
    marginLeft: countcoordinatesY(10),
    paddingTop: countcoordinatesY(3),
  },
  bottom: {
    backgroundColor: HeavyBGColor,
    flex: 1,
    flexDirection: 'row',
    alignItems: 'flex-end',
    alignItems: 'center',
  },
  name: {
    backgroundColor: BoldBGColor,
  },
  eye: {
    width: 10,
    height: 10,
    backgroundColor: LightBGColor,
  },
  number: {
    marginLeft: countcoordinatesY(5),
    flex: 1,
  },
  tag: {

  }
})