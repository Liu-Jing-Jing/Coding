
import {
  Dimensions,
  Platform,
  PixelRatio
} from 'react-native';

/// 宽高
var {height, width} = Dimensions.get('window');
var ScreenHeight = height;
var ScreenWidth = width;
/// 是否是iPhoneX
var isIphoneX = ()=>{
  const X_WIDTH = 375;
  const X_HEIGHT = 812;
  return 
  Platform.OS === 'ios' &&
        ((ScreenHeight === X_HEIGHT && ScreenWidth === X_WIDTH) ||
         (ScreenHeight === X_WIDTH && ScreenWidth === X_HEIGHT))
}

/// 比例X
var countcoordinatesX = (x)=>{
  return ScreenWidth * (x / 320);
}
/// 比例Y
var countcoordinatesY = (y)=>{
  return ScreenHeight * (y / 568);
}
/// 状态栏
var StatusBarHeight = ()=>{
  if (isIphoneX()) {
    return 44
  }
  else {
    return 20
  }
}
/// 底部安全区域
var SafeAreaBottomHeight = ()=>{
  if (isIphoneX()) {
    return 34;
  }
  else {
    return 0;
  }
}
/// 导航栏
var NavigationHeight = ()=>{
  return StatusBarHeight() + 44;
}
/// Tabbar高度
var TabbarHeight = ()=>{
  return SafeAreaBottomHeight + 64;
}

export {
  ScreenHeight, 
  ScreenWidth, 
  countcoordinatesX, 
  countcoordinatesY,
  StatusBarHeight,
  SafeAreaBottomHeight,
  NavigationHeight,
  TabbarHeight
}