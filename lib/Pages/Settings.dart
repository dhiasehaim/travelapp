import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder:(context, child) {
        return Scaffold(
          backgroundColor: Color.fromARGB(255, 230, 240, 233),
        );
      },
    );
  }
}