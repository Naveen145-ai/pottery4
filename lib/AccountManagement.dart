import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'lacaleString.dart'; // Correct import for localization

class AccountManagementPage extends StatefulWidget {
  @override
  _AccountManagementPageState createState() => _AccountManagementPageState();
}

class _AccountManagementPageState extends State<AccountManagementPage> {
  // Controllers to handle text input fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _businessNameController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Management'.tr), // Translated text
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            // Profile Section
            Text(
              'Profile Information'.tr,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Full Name'.tr,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email'.tr,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // Business Information Section
            Text(
              'Business Information'.tr,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _businessNameController,
              decoration: InputDecoration(
                labelText: 'Business Name'.tr,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _contactController,
              decoration: InputDecoration(
                labelText: 'Business Contact'.tr,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // Password Change Section
            Text(
              'Change Password'.tr,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'New Password'.tr,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // Save Changes Button
            ElevatedButton(
              onPressed: () {
                _saveAccountDetails();
              },
              child: Text('Save Changes'.tr),
            ),
          ],
        ),
      ),
    );
  }

  // Function to save account details
  void _saveAccountDetails() {
    String name = _nameController.text;
    String email = _emailController.text;
    String businessName = _businessNameController.text;
    String contact = _contactController.text;
    String password = _passwordController.text;

    // Logic to save the updated account details (e.g., API call or local storage)
    // For now, we just display the details in the console
    print('Updated Account Details:');
    print('Name: $name');
    print('Email: $email');
    print('Business Name: $businessName');
    print('Contact: $contact');
    print('Password: $password');

    // Show success message
    Get.snackbar(
      'Success'.tr,
      'Account details updated successfully.'.tr,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
