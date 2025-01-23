import 'package:flutter/material.dart';
import 'package:rika_ecomm_app/config/common.dart';

class AppTheme {
  final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.light(
        primary: Colors.black,
        onPrimary: Colors.white,
        secondary: Colors.grey,
        onSecondary: Color(0xff808080),
        tertiary: Color.fromARGB(255, 240, 240, 240),
        onTertiary:Colors.white,
         outline: Color(0xff333333)
        ),
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color.fromARGB(255, 244, 242, 242),
    textTheme:
        textTheme.apply(displayColor: Colors.black, bodyColor: Colors.black),
    primaryColor: Colors.black,
    useMaterial3: true,
    fontFamily: "Mont_Blanc_Regular",
    appBarTheme: AppBarTheme(
      backgroundColor:Color.fromARGB(255, 240, 240, 240),
      surfaceTintColor: Color.fromARGB(255, 240, 240, 240),
      iconTheme: IconThemeData(color: Colors.black),
    ),
    buttonTheme: ButtonThemeData(buttonColor: Colors.black),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        textStyle: TextStyle(
          fontFamily: FontFamily.w700,
        ),
      ),
    ),
    iconTheme: IconThemeData(color: Colors.black),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.black; // Thumb color when the switch is ON
        }
        return Colors.grey; // Thumb color when the switch is OFF
      }),
      trackColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.black
              .withOpacity(0.5); // Track color when the switch is ON
        }
        return Colors.grey
            .withOpacity(0.5); // Track color when the switch is OFF
      }),
    ),
    cardTheme: CardTheme(
      color: Colors.white,
    ),
    chipTheme: ChipThemeData(
     
      shape: const StadiumBorder(side: BorderSide(color: Color(0xff808080),),),
    ),
  );

  final ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.dark(
     primary: Colors.white,
        onPrimary: Colors.black,
        secondary: const Color.fromARGB(255, 190, 190, 190),
        onSecondary: Color(0xff2e2e2e),
        tertiary: Color(0xff959595),
        onTertiary: Color(0xff333333),
        outline: Color(0xff333333)

    ),
    brightness: Brightness.dark,
    snackBarTheme: SnackBarThemeData(
      backgroundColor: Colors.grey,
    ),
    scaffoldBackgroundColor: Color(0xff191919),
    textTheme:
        textTheme.apply(displayColor: Colors.white, bodyColor: Colors.white),
    useMaterial3: true,
    fontFamily: "Mont_Blanc_Regular",
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff1A1A1A),
      surfaceTintColor: Color(0xff1A1A1A),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    buttonTheme: ButtonThemeData(buttonColor: Colors.white),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        textStyle: TextStyle(
          fontFamily: FontFamily.w700,
        ),
      ),
    ),
    iconTheme: IconThemeData(color: Colors.white),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.white; // Thumb color when the switch is ON
        }
        return Colors.grey; // Thumb color when the switch is OFF
      }),
      trackColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.white
              .withOpacity(0.5); // Track color when the switch is ON
        }
        return Colors.grey
            .withOpacity(0.5); // Track color when the switch is OFF
      }),
    ),
    cardTheme: CardTheme(
      color: Color(0xff1A1A1A),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: Colors.black,
      selectedColor: Colors.white,
      disabledColor: Colors.black,
      // side: BorderSide(color: Colors.white),
      shape: const StadiumBorder(side: BorderSide(color: Color(0xff333333))),
    ),
  );

  static final textTheme = Typography.englishLike2021.copyWith(
    headlineSmall: TextStyle(fontSize: 28, fontFamily: FontFamily.w700),
    titleMedium: TextStyle(fontFamily: FontFamily.w700),
  );
}
