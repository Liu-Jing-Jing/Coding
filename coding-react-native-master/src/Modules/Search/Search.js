import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
} from 'react-native';
import { StatusBarHeight } from '../../Define/PublicMacros';

export default class Search extends Component {
  render() {
    return (
      <View style={styles.container}>
        <Text>Search</Text>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#F5FCFF',
    position: 'absolute',
    left: 0,
    bottom: 0,
    right: 0,
    top: StatusBarHeight() + 35,
  }
});
