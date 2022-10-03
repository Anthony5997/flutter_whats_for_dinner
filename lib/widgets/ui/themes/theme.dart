import 'package:flutter/material.dart';

var primaryColor = Color(0xFFCA2525);
var primaryColorLight = Color(0xFFE42B2B);
var primaryColorDark = Color(0xFFAF1E1E);

var secondaryColor = Color(0xFFEEEEEE);
var secondaryColorLight = Color(0xFFFAFAFA);
var secondaryColorDark = Color(0xFFD8D8D8);

var Background = const Color(0xFFfffdf7);
var TextColor = const Color(0xFF004d40);

class LigthTheme {
  static final ThemeData themedata = ThemeData(
    primaryColor: primaryColor,

    // Define the default font family.
    fontFamily: 'Roboto',

    // Define the default `TextTheme`. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    appBarTheme: AppBarTheme(
      color: primaryColor,
    ),
    drawerTheme: DrawerThemeData(
        // backgroundColor: SecondaryColor,
        // scrimColor: primaryColor
        ),
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold, color: Colors.white),
      headline6: TextStyle(fontSize: 36.0, fontFamily: "LemonDays", color: Colors.red),
      bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Roboto'),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: primaryColor,
      ),
    ),
    scaffoldBackgroundColor: secondaryColor,
    // textTheme: TextTheme(
    //   bodyText1: TextStyle(),
    //   bodyText2: TextStyle(),
    // ).apply(
    //   bodyColor: Colors.red[700],
    // ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: secondaryColor,
      selectedIconTheme: IconThemeData(color: primaryColor),
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.blueGrey,
      selectedLabelStyle: const TextStyle(color: Color.fromRGBO(120, 120, 120, 1), fontFamily: "LemonDays", fontSize: 14),
      unselectedLabelStyle: const TextStyle(fontFamily: "LemonDays", fontSize: 14),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(primary: primaryColor, textStyle: const TextStyle(fontSize: 16.0, fontFamily: "LemonDays", fontStyle: FontStyle.italic, color: Colors.red), side: BorderSide(color: primaryColorDark, width: .5), elevation: 4, padding: EdgeInsets.all(20)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusColor: primaryColor,
      prefixIconColor: primaryColor,
      iconColor: primaryColor,
      fillColor: primaryColor,
      floatingLabelStyle: TextStyle(color: primaryColor),
      hintStyle: TextStyle(color: primaryColorDark, fontSize: 10),
      focusedBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(0)),
        borderSide: BorderSide(color: primaryColor, width: 2),
      ),
    ),
  );
}

//  InputDecoration(
//         label: Text("Email"),
//         icon: Icon(Icons.email),
//         hintStyle: TextStyle(color: Colors.red),
//         fillColor: Colors.white,
//         floatingLabelStyle: TextStyle(color: Colors.red),
//         focusedBorder: UnderlineInputBorder(
//           borderRadius: BorderRadius.all(Radius.circular(0)),
//           borderSide: BorderSide(color: Colors.red, width: 2),
//         ),
//       ),

////////////////////////////////////////////////////////////////////////////////
///             DARK MODE
////////////////////////////////////////////////////////////////////////////////
class DarkTheme {
  static final ThemeData themedata = ThemeData(
    appBarTheme: const AppBarTheme(
      color: Colors.teal,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: Colors.red[700],
      ),
    ),
    scaffoldBackgroundColor: Colors.grey[200],
    textTheme: const TextTheme(
      bodyText1: TextStyle(),
      bodyText2: TextStyle(),
    ).apply(
      bodyColor: Colors.red[700],
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: secondaryColor,
      selectedIconTheme: const IconThemeData(color: Colors.amber),
      selectedItemColor: Colors.red[700],
      unselectedItemColor: Colors.blueGrey,
      selectedLabelStyle: const TextStyle(color: Color.fromRGBO(120, 120, 120, 1)),
    ),
  );
}
