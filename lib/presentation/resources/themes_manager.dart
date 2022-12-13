import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors_manager.dart';
import 'styles_manager.dart';
import 'fonts_manager.dart';
import 'values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      //main colors
      primaryColor: ColorManager.primary,
      primaryColorLight: ColorManager.lightPrimary,
      primaryColorDark: ColorManager.darkPrimary,
      disabledColor: ColorManager.grey1,
      splashColor: ColorManager.lightPrimary,
      //card view theme
      cardTheme: const CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.grey,
        elevation: AppSize.s6,
      ),
      //app bar theme
      appBarTheme: AppBarTheme(
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: ColorManager.darkGrey,
              statusBarIconBrightness: Brightness.light),
          color: ColorManager.primary,
          shadowColor: ColorManager.lightPrimary,
          elevation: AppSize.s4,
          centerTitle: true,
          titleTextStyle: getRegularStyle(
              color: ColorManager.white, fontSize: FontSizeManager.s16)),
      //button theme
      buttonTheme: const ButtonThemeData(
          shape: StadiumBorder(),
          disabledColor: ColorManager.grey1,
          buttonColor: ColorManager.primary,
          splashColor: ColorManager.lightPrimary),
      // elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle: getRegularStyle(
                  color: ColorManager.white, fontSize: FontSizeManager.s16),
              primary: ColorManager.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s12)))),
      //text theme
      textTheme: TextTheme(
          displayLarge: getLightStyle(
              color: ColorManager.white, fontSize: FontSizeManager.s22),
          headlineLarge: getSemiBoldStyle(
              color: ColorManager.darkGrey, fontSize: FontSizeManager.s18),
          headlineSmall: getRegularStyle(
              color: ColorManager.darkGrey, fontSize: FontSizeManager.s14),
          titleLarge: getSemiBoldStyle(
              color: ColorManager.grey, fontSize: FontSizeManager.s16),
          titleMedium: getMediumStyle(
              color: ColorManager.primary, fontSize: FontSizeManager.s16),
          bodyMedium: getRegularStyle(
              color: ColorManager.grey1, fontSize: FontSizeManager.s12),
          bodySmall: getRegularStyle(
              color: ColorManager.grey, fontSize: FontSizeManager.s10)),
      //input decoration theme(text form field)
      inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.all(AppPadding.p8),
          hintStyle: getRegularStyle(
              color: ColorManager.grey, fontSize: FontSizeManager.s14),
          labelStyle: getRegularStyle(
              color: ColorManager.grey, fontSize: FontSizeManager.s14),
          errorStyle: getRegularStyle(color: ColorManager.error),
          enabledBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
              borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
          focusedBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
              borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
          errorBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(color: ColorManager.error, width: AppSize.s1_5),
              borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
          focusedErrorBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
              borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)))));
}
