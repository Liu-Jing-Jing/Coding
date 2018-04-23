import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
  Image,
  TouchableOpacity
} from 'react-native';
import {ScreenWidth, ThinBGColor, LightBGColor, countcoordinatesY} from '../../../Public/Public';

class HomeTechnicalItem extends Component {
  render() {
    return (
      <TouchableOpacity activeOpacity={0.9}>
        <View style={styles.item}>
          <Image style={styles.itemIcon}/>
          <Text style={styles.itemText}>123</Text>
        </View>
      </TouchableOpacity>
    )
  }
}

export default class HomeTechnical extends Component {
  render() {
    return (
      <View style={[styles.container, this.props.style]}>
        <HomeTechnicalItem/>
        <HomeTechnicalItem/>
        <HomeTechnicalItem/>
      </View>
    );
  }
}

var styles = StyleSheet.create({
  container: {
    flexDirection: 'row',
  },
  item: {
    width: ScreenWidth / 3,
    height: ScreenWidth / 3 / 3 * 2,
    backgroundColor: ThinBGColor,
    alignItems: 'center',
    paddingTop: 5,
    paddingBottom: 5,
  },
  itemIcon: {
    flex: 1,
    width: ScreenWidth / 3,
    backgroundColor: LightBGColor
  },
  itemText: {
    marginTop: 5,
    fontSize: 14,
    backgroundColor: LightBGColor,
  }
})