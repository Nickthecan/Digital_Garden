import 'package:flutter/material.dart';
import 'package:digital_garden/pages/login.dart';
import 'package:digital_garden/pages/main_menu.dart';
import 'package:digital_garden/pages/plan.dart';
import 'package:digital_garden/pages/track.dart';
import 'package:digital_garden/pages/goals.dart';
import 'package:digital_garden/pages/settings.dart';
import 'package:digital_garden/pages/expense.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    debugShowMaterialGrid: false,
    initialRoute: '/',
    routes: {
      '/': (context) => Login(),
      '/main_menu': (context) => MainMenu(),
      '/plan': (context) => Plan(),
      '/track': (context) => Track(),
      '/goals': (context) => Goals(),
      '/settings': (context) => Settings(),
          '/expense': (context) => Expense(),
    }
));

