/*import 'package:flutter/material.dart';
import 'lacalestring.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Accessing the translated strings using LocaleString
    final locale = LocaleString.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(locale.translate('account_settings')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.account_circle, size: 100, color: Colors.blue),
            SizedBox(height: 20),
            Text(
              locale.translate('manage_account_info'),
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement logic for updating account info
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(locale.translate('update_account_info')),
                      content: TextField(
                        decoration: InputDecoration(
                          labelText: locale.translate('new_account_info'),
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(locale.translate('cancel')),
                        ),
                        TextButton(
                          onPressed: () {
                            // Save new account info
                            Navigator.pop(context);
                          },
                          child: Text(locale.translate('save')),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text(locale.translate('update_account_info')),
            ),
          ],
        ),
      ),
    );
  }
}*/
