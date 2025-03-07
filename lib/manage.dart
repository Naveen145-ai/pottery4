import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'lacalestring.dart';  // Import the LocaleString file

class AccountManagementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('account_management'.tr),  // Translated title
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.security, size: 100, color: Colors.orange),
            SizedBox(height: 20),
            Text(
              'manage_account_security'.tr,  // Translated text
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to Change Password page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangePasswordPage(),
                  ),
                );
              },
              child: Text('change_password'.tr),  // Translated button text
            ),
            ElevatedButton(
              onPressed: () {
                // Implement logic for enabling 2FA
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('enable_2fa'.tr),  // Translated text
                      content: Text('enable_2fa_prompt'.tr),  // Translated prompt
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('cancel'.tr),  // Translated button text
                        ),
                        TextButton(
                          onPressed: () {
                            // Enable 2FA
                            Navigator.pop(context);
                          },
                          child: Text('enable'.tr),  // Translated button text
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('enable_2fa'.tr),  // Translated button text
            ),
          ],
        ),
      ),
    );
  }
}

class ChangePasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('change_mobile_number'.tr),  // Translated title
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('enter_new_mobile_number'.tr),  // Translated text
            TextField(
              decoration: InputDecoration(labelText: 'new_mobile_number'.tr),  // Translated label
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                // Change the password logic here
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('mobile_number_changed'.tr)),  // Translated text
                );
                Navigator.pop(context); // Go back to previous page
              },
              child: Text('change_mobile_number'.tr),  // Translated button text
            ),
          ],
        ),
      ),
    );
  }
}
