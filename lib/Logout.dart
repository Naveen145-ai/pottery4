import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'loginPage.dart';

class LogoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logout'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Are you sure you want to log out?',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Confirm logout and navigate back to the login screen
                    Get.offAll(() => LoginPage());
                  },
                  child: Text('Yes, Logout'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    // Cancel logout and go back to the previous screen
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
