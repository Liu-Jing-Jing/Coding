import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
  TextInput,
} from 'react-native';
import { ScreenWidth, NavigationHeight, countcoordinatesX } from '../../Utils/Define';
import { ColorBg } from '../../Utils/ColorUtils';

export default class StoreBar extends Component {
  render() {
    return (
      <View style={styles.container}>
        <TextInput 
        style={styles.input}
        placeholder={"搜索音乐"}
        />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    width: ScreenWidth,
    height: 80,
    backgroundColor: ColorBg,
  },
  input: {
    width: ScreenWidth - countcoordinatesX(30),
    marginLeft: countcoordinatesX(15),
    height: 35,
    backgroundColor: 'white',
    marginTop: 20,
    borderRadius: 5,
    paddingLeft: 40,
  }
});
