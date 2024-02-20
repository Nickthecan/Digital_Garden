import 'package:flutter/material.dart';
import 'package:digital_garden/pages/login.dart';
import 'package:digital_garden/pages/main_menu.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    debugShowMaterialGrid: false,
    initialRoute: '/',
    routes: {
      '/': (context) => Login(),
      '/main_menu': (context) => MainMenu(),
    }
));

