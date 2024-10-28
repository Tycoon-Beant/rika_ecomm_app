import 'package:flutter/material.dart';

abstract class FontFamily {
  static String get w700 => "Mont_Blanc_Bold";
  static String get w800 => "Mont_Blanc_Black";
  static String get w400 => "Mont_Blanc_Regular";
  static String get w300 => "Mont_Blanc_Light";
}

extension ThemeGetter on BuildContext {
  TextTheme get theme => Theme.of(this).textTheme;
}
