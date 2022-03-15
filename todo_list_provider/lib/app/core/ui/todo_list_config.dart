import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoListConfig {
  TodoListConfig._();
  static get theme => ThemeData(
      textTheme: GoogleFonts.mandaliTextTheme(),
      primaryColor: const Color(0XFF5C77CE),
      primaryColorLight: const Color(0XFFABCBF7),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              primary: const Color(
        0XFF5C77CE,
      ))));
}
