import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DarkPage extends StatefulWidget {
  @override
  _DarkModePageState createState() => _DarkModePageState();
}

class _DarkModePageState extends State<DarkPage> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dark Mode'.tr),
      ),
      body: Center(
        child: SwitchListTile(
          title: Text('Enable Dark Mode'.tr),
          value: _isDarkMode,
          onChanged: (bool value) {
            setState(() {
              _isDarkMode = value;
            });
            // Apply theme changes here
            if (_isDarkMode) {
              Get.changeTheme(ThemeData.dark());
            } else {
              Get.changeTheme(ThemeData.light());
            }
          },
        ),
      ),
    );
  }
}
