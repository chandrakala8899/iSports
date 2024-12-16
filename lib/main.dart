import 'package:flutter/material.dart';
import 'package:isports/organiser/profile_create_home.dart';
import 'package:isports/shared/theme_data.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: themeData, home: OrganizerProfileCreate());
  }
}
