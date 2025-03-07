import 'package:flutter/material.dart';

class DataSyncPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Sync'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.cached, size: 100, color: Colors.green),
            SizedBox(height: 20),
            Text(
              'Data Sync in Progress',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text('Synchronize your data across devices and platforms.'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add your sync logic here
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Data Sync Started')),
                );
                // Simulate a sync process
                Future.delayed(Duration(seconds: 2), () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Data Sync Completed')),
                  );
                });
              },
              child: Text('Start Sync'),
            ),
          ],
        ),
      ),
    );
  }
}
