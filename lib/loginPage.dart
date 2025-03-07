import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'combinedHome.dart';
import 'sellers.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  bool _showOtpField = false;
  String _generatedOtp = '';
  String _selectedRole = 'Customer';

  bool _isValidPhoneNumber(String phone) {
    return RegExp(r'^[6-9][0-9]{9}$').hasMatch(phone);
  }

  bool _isValidEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(email);
  }

  void _generateOtp() {
    final random = Random();
    _generatedOtp = (100000 + random.nextInt(900000)).toString();
    _otpController.text = _generatedOtp;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Your OTP is $_generatedOtp")),
    );
  }

  void _login() {
    String phone = _phoneController.text.trim();
    String email = _emailController.text.trim();

    if (!_isValidEmail(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter a valid email (e.g., example@gmail.com)")),
      );
      return;
    }

    if (_selectedRole == 'Seller' || _selectedRole == 'Customer') {
      if (_isValidPhoneNumber(phone)) {
        setState(() {
          _showOtpField = true;
        });
        _generateOtp();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please enter a valid phone number starting with 6-9 and Enter 10 numbers only")),
        );
      }
    }
  }

  void _verifyOtp() {
    String otp = _otpController.text.trim();
    if (otp == _generatedOtp) {
      if (_selectedRole == 'Seller') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SellersPage()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => CombinedHomePage()),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Invalid OTP")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pottery App'),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.lightBlue[50],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton<String>(
                value: _selectedRole,
                items: ['Customer', 'Seller']
                    .map((role) => DropdownMenuItem(
                  child: Text(role),
                  value: role,
                ))
                    .toList(),
                onChanged: (newRole) {
                  setState(() {
                    _selectedRole = newRole!;
                    _showOtpField = false;
                  });
                },
              ),
              SizedBox(height: 10),

              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Enter your Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),

              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                  labelText: 'Enter phone number',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),

              if (_showOtpField)
                TextField(
                  controller: _otpController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter OTP',
                    border: OutlineInputBorder(),
                  ),
                ),
              SizedBox(height: 20),

              ElevatedButton(
                onPressed: _showOtpField ? _verifyOtp : _login,
                child: Text(_showOtpField ? 'Verify OTP' : 'Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

