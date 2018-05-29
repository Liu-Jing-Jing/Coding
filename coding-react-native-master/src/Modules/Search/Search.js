import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
  SectionList
} from 'react-native';
import SearchHeader from './SearchHeader';
import { StatusBarHeight } from '../../Define/PublicMacros';

export default class Search extends Component {


  getView(width) {
    return (
      <View style={{width: width, height: 30, backgroundColor: 'red', marginLeft: 10}}/>
    )
  }

  render() {
    return (
      <View style={styles.container}>
        <SectionList
          renderItem={({item}) => <Text>{item.key}</Text>}
          renderSectionHeader={({section}) => <Text>{section.title}</Text>}
          sections={[ 
            {data: [{key: 'a'}, {key: 'b'}], title: '123123'},
          ]}
        />
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
    top: StatusBarHeight() + 65,
    flexDirection: 'row',
    flexWrap: 'wrap',
  }
});
