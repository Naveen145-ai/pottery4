import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Import the other pages (account.dart, dark.dart, management.dart, help.dart, datasync.dart)
import 'account.dart';
import 'dark.dart';
import 'manage.dart';
import 'help.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('settings'.tr), // Using translation for "Settings"
      ),
      body: ListView(
        children: [
         /* ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('account_settings'.tr), // Using translation for "Account Settings"
            onTap: () {
              // Navigate to Account Settings page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AccountManagementPage()),
              );
            },
          ),*/
          ListTile(
            leading: Icon(Icons.dark_mode),
            title: Text('dark_mode'.tr), // Using translation for "Dark Mode"
            onTap: () {
              // Navigate to Dark Mode page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DarkPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.security),
            title: Text('account_management'.tr), // Using translation for "Account Management"
            onTap: () {
              // Navigate to Account Management page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AccountManagementPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('help_support'.tr), // Using translation for "Help & Support"
            onTap: () {
              // Navigate to Help & Support page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HelpPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
