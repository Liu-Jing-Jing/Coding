import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
  Image,
  TouchableOpacity
} from 'react-native';
import {ScreenWidth, ThinBGColor, LightBGColor, countcoordinatesY, countcoordinatesX, HeavyBGColor} from '../../../Public/Public';

export default class HomeSectionFooter extends Component {
  render() {
    return (
      <View style={styles.container}>
        <TouchableOpacity>
          <View style={styles.textv}>
            <Text style={styles.text}>更多</Text>
          </View>
        </TouchableOpacity>
      </View>
    );
  }
}

var styles = StyleSheet.create({
  container: {
    height: countcoordinatesY(45),
    width: ScreenWidth,
    backgroundColor: ThinBGColor,
    alignItems: 'center',
    justifyContent: 'center'
  },
  textv: {
    justifyContent: 'center',
    alignItems: 'center',
    borderColor: HeavyBGColor,
    borderWidth: 1,
    height: 30,
    width: 60,
    borderRadius: 15,
  },
  text: {
    fontSize: 12,
    color: HeavyBGColor,
    marginLeft: 2,
  }
})