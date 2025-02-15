import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(
    double fontSize, FontWeight fontWeight, Color color, String fontFamily) {
  return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      fontFamily: fontFamily);
}

//return regular style
TextStyle getRegularStyle({
  double fontSize = FontSize.s12,
  String fontFamily = 'BalooThambi400',
  required Color color,
}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color, fontFamily);
}

// return light style
TextStyle getLightStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    String fontFamily = 'BalooThambi400'}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color, fontFamily);
}

// return bold style
TextStyle getBoldStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    String fontFamily = 'BalooThambi800'}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color, fontFamily);
}

// return semi bold style
TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    String fontFamily = 'BalooThambi800'}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color, fontFamily);
}

// return medium style
TextStyle getMediumStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    String fontFamily = 'BalooThambi400'}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color, fontFamily);
}
