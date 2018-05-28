import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
  Image,
  TouchableHighlight
} from 'react-native';

var ButtonStyle = {
  "Left" : 0, 
  "Right" : 1, 
};

export default class KKButton extends Component {

  name() {
    if (this.props.name) {
      return (
        <Text>asdasdad</Text>
      )
    }
  }
  icon() {
    if (this.props.icon) {
      return (
        <Image 
          style={styles.icon}
          source={{uri: this.props.icon}}
        />
      )
    }
  }
  padding() {
    return (
      <View style={{width: 3}}/>
    )
  }
  

  content = ()=>{
    if (this.props.button_style == ButtonStyle.Left) {
      return ([
        this.name(),
        this.padding(),
        this.icon()
      ])
    } else if (this.props.button_style == ButtonStyle.Right) {
      return ([
        this.icon(),
        this.padding(),
        this.name()
      ])
    } 
  }

  render() {
    return (
      <TouchableHighlight style={styles.touch}>
        <View style={styles.container}>
          {this.content()}
        </View>
      </TouchableHighlight>
    );
  }
}

const styles = StyleSheet.create({
  touch: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  container: {
    flexDirection: 'row',
    alignItems: 'center',
    paddingLeft: 5,
    paddingRight: 5,
  },
  icon: {
    width: 20,
    height: 20,
  }
});



export {ButtonStyle}