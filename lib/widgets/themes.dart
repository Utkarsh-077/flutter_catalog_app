// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemes{
  
static ThemeData lightTheme(BuildContext context)  => ThemeData(
          primarySwatch: Colors.deepPurple,
          primaryTextTheme: GoogleFonts.latoTextTheme(),
            appBarTheme: AppBarTheme(
            color: Colors.white,
            foregroundColor: Colors.black,
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.black),
            
          )
          );
static ThemeData darkTheme(BuildContext context)  => ThemeData(
           brightness: Brightness.dark,
          );

}