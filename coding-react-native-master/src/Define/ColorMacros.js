
var RGBA = (r, g, b, a)=>{
  return 'rgba(' + r + ', ' + g + ', ' + b + ', ' + a + ')'
}
const HeavyColor  = RGBA(0.040, 0.154, 0.278, 1);
const BoldColor   = RGBA(0.201, 0.437, 0.694, 1);
const MediumColor = RGBA(0.438, 0.706, 1, 1);
const LightColor  = RGBA(0.585, 0.783, 1, 1);
const ThinColor = RGBA(0.733, 0.860, 1, 1);
const ColorBg   = RGBA(50, 50, 50, 1);
const ColorLine = RGBA(200, 200, 200, 0.3);

export {
  HeavyColor,
  BoldColor,
  MediumColor,
  LightColor,
  ThinColor,
  ColorBg,
  ColorLine
}
