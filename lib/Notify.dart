import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotifyPage extends StatefulWidget {
  @override
  _NotifyPageState createState() => _NotifyPageState();
}

class _NotifyPageState extends State<NotifyPage> {
  bool _showNewPotIcon = false; // Track whether the new product icon should be displayed
  bool _showHikingPotDetails = false; // Track whether hiking pot details should be displayed

  @override
  void initState() {
    super.initState();
    // Simulate a new product arrival notification after a delay
    Future.delayed(Duration(seconds: 3), () {
      _showNotification('New Product Arrival!'.tr, 'Check out our new pottery collection.'.tr);
    });
  }

  // Function to show notification using a Snackbar
  void _showNotification(String title, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.notifications, color: Colors.white),
            SizedBox(width: 10),
            Expanded(child: Text('$title: $message')),
            IconButton(
              icon: Icon(Icons.hiking_rounded, color: Colors.white),
              onPressed: () {
                setState(() {
                  _showNewPotIcon = true; // Show the new pot icon when clicked
                });
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),
          ],
        ),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 5),
      ),
    );
  }

  // Function to toggle the display of hiking pot details
  void _showHikingPotDetailsDialog() {
    setState(() {
      _showHikingPotDetails = !_showHikingPotDetails; // Toggle hiking pot details
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'.tr),
        backgroundColor: Colors.redAccent, // Changed app bar color for better contrast
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.redAccent, Colors.redAccent], // Background gradient
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0), // Added padding to content
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'New products.'.tr,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 10),
                    IconButton(
                      icon: Icon(Icons.new_releases, color: Colors.white),
                      onPressed: () {
                        // Show new product arrival notification when the button is pressed
                        _showNotification('New Product Arrival!'.tr, 'Check out our new pottery collection.'.tr);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                _showNewPotIcon
                    ? Column(
                  children: [
                    GestureDetector(
                      onTap: _showHikingPotDetailsDialog,
                      child: Column(
                        children: [
                          Icon(Icons.hiking, size: 100, color: Colors.teal),
                          SizedBox(height: 10),
                          Text(
                            'Hiking Pot'.tr,
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    if (_showHikingPotDetails)
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hiking Pot Details:'.tr,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '1. Lightweight and Compact: Made from lightweight materials like aluminum or titanium, making it easy to carry.'.tr,
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '2. Durable and Heat-Resistant: Withstands high heat and rugged conditions for outdoor use.'.tr,
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '3. Efficient Heat Distribution: Conducts heat well, reducing fuel use.'.tr,
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '4. Multi-Functional Design: Includes features like foldable handles, strainer lids, and measurement markings.'.tr,
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '5. Easy to Clean: Often non-stick, making it convenient for minimal-waste camping.'.tr,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                  ],
                )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
