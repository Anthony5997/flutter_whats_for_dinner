import 'package:flutter/material.dart';

var PrimaryColor = Color(0xFFCA2525);
var PrimaryColorLight = Color(0xFFE42B2B);
var PrimaryColorDark = Color(0xFFAF1E1E);

var SecondaryColor = Color(0xFFEEEEEE);
var SecondaryColorLight = Color(0xFFFAFAFA);
var SecondaryColorDark = Color(0xFFD8D8D8);

var Background = const Color(0xFFfffdf7);
var TextColor = const Color(0xFF004d40);

class LigthTheme {
  static final ThemeData themedata = ThemeData(
    primaryColor: PrimaryColor,

    // Define the default font family.
    fontFamily: 'Roboto',

    // Define the default `TextTheme`. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    appBarTheme: AppBarTheme(
      color: PrimaryColor,
    ),
    drawerTheme: DrawerThemeData(
        // backgroundColor: SecondaryColor,
        // scrimColor: PrimaryColor
        ),
    textTheme: const TextTheme(
      headline1: TextStyle(
          fontSize: 72.0, fontWeight: FontWeight.bold, color: Colors.white),
      headline6:
          TextStyle(fontSize: 36.0, fontFamily: "LemonDays", color: Colors.red),
      bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Roboto'),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: PrimaryColor,
      ),
    ),
    scaffoldBackgroundColor: SecondaryColor,
    // textTheme: TextTheme(
    //   bodyText1: TextStyle(),
    //   bodyText2: TextStyle(),
    // ).apply(
    //   bodyColor: Colors.red[700],
    // ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: SecondaryColor,
      selectedIconTheme: IconThemeData(color: PrimaryColor),
      selectedItemColor: PrimaryColor,
      unselectedItemColor: Colors.blueGrey,
      selectedLabelStyle: TextStyle(color: Color.fromRGBO(120, 120, 120, 1)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          primary: PrimaryColor,
          textStyle: const TextStyle(
              fontSize: 16.0, fontStyle: FontStyle.italic, color: Colors.red),
          side: BorderSide(color: PrimaryColorDark, width: .5),
          elevation: 4,
          padding: EdgeInsets.all(20)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusColor: PrimaryColor,
      prefixIconColor: PrimaryColor,
      iconColor: PrimaryColor,
      fillColor: PrimaryColor,
      floatingLabelStyle: TextStyle(color: PrimaryColor),
      hintStyle: TextStyle(color: PrimaryColorDark, fontSize: 10),
      focusedBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(0)),
        borderSide: BorderSide(color: PrimaryColor, width: 2),
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
    appBarTheme: AppBarTheme(
      color: Colors.teal,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: Colors.red[700],
      ),
    ),
    scaffoldBackgroundColor: Colors.grey[200],
    textTheme: TextTheme(
      bodyText1: TextStyle(),
      bodyText2: TextStyle(),
    ).apply(
      bodyColor: Colors.red[700],
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: SecondaryColor,
      selectedIconTheme: IconThemeData(color: Colors.amber),
      selectedItemColor: Colors.red[700],
      unselectedItemColor: Colors.blueGrey,
      selectedLabelStyle: TextStyle(color: Color.fromRGBO(120, 120, 120, 1)),
    ),
  );
}
