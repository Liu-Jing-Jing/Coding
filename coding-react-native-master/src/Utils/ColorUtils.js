
var RGBA = (r, g, b, a)=>{
  return 'rgba(' + r + ', ' + g + ', ' + b + ', ' + a + ')'
}
var HeavyColor = RGBA(0.040, 0.154, 0.278, 1);
var BoldColor = RGBA(0.201, 0.437, 0.694, 1);
var MediumColor = RGBA(0.438, 0.706, 1, 1);
var LightColor = RGBA(0.585, 0.783, 1, 1);
var ThinColor = RGBA(0.733, 0.860, 1, 1);

var ColorBg = RGBA(50, 50, 50, 1);

var ColorLine = RGBA(200, 200, 200, 0.3);

export {
  HeavyColor,
  BoldColor,
  MediumColor,
  LightColor,
  ThinColor,
  ColorBg,
  ColorLine
}

// #define WhiteColor [UIColor whiteColor]

// #define ColorTextHeavy  [UIColor colorWithRed:20/255.f  green:20/255.f  blue:20/255.f  alpha:1.0]
// #define ColorTextBold   [UIColor colorWithRed:90/255.f  green:90/255.f  blue:90/255.f  alpha:1.0]
// #define ColorTextMedium [UIColor colorWithRed:181/255.f green:181/255.f blue:181/255.f alpha:1.0]
// #define ColorTextLight  [UIColor colorWithRed:197/255.f green:197/255.f blue:197/255.f alpha:1.0]
// #define ColorTextThin   [UIColor colorWithRed:215/255.f green:215/255.f blue:215/255.f alpha:1.0]

// #define ColorBg     [UIColor colorWithRed:245/255.f green:245/255.f blue:245/255.f alpha:1.0]

// #define FontName(A) [UIFont systemFontOfSize:adjustFont(A)]