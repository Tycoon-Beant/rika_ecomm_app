import 'package:flutter/material.dart';

String imageBaseUrl = "http://192.168.1.23:8080/";
String baseUrl = "http://192.168.1.23:8080/api/v1/";
abstract class FontFamily {
  static String get w700 => "Mont_Blanc_Bold";
  static String get w800 => "Mont_Blanc_Black";
  static String get w400 => "Mont_Blanc_Regular";
  static String get w300 => "Mont_Blanc_Light";
}

extension ThemeGetter on BuildContext {
  TextTheme get theme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}
