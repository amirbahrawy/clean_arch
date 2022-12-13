import 'package:flutter/material.dart';

import 'fonts_manager.dart';
//regular style
 TextStyle getRegularStyle({
  double fontSize = FontSizeManager.s12, required Color color,}){
  return  TextStyle(
      fontFamily: FontConstants.fontFamily,
      fontWeight: FontWeightManager.regular,
      color: color,
      fontSize: fontSize);
}
//medium style
TextStyle getMediumStyle({
  double fontSize = FontSizeManager.s12,
  required Color color,
}) {
  return TextStyle(
      fontFamily: FontConstants.fontFamily,
      fontWeight: FontWeightManager.medium,
      color: color,
      fontSize: fontSize);
}
//light style
TextStyle getLightStyle({
  double fontSize = FontSizeManager.s12,
  required Color color,
}) {
  return TextStyle(
      fontFamily: FontConstants.fontFamily,
      fontWeight: FontWeightManager.light,
      color: color,
      fontSize: fontSize);
}
//semi-bold style
TextStyle getSemiBoldStyle({
  double fontSize = FontSizeManager.s12,
  required Color color,
}) {
  return TextStyle(
      fontFamily: FontConstants.fontFamily,
      fontWeight: FontWeightManager.semiBold,
      color: color,
      fontSize: fontSize);
}
//bold style
TextStyle getBoldStyle({
  double fontSize = FontSizeManager.s12,
  required Color color,
}) {
  return TextStyle(
      fontFamily: FontConstants.fontFamily,
      fontWeight: FontWeightManager.bold,
      color: color,
      fontSize: fontSize);
}