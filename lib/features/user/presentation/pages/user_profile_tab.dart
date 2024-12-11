import 'package:flutter/material.dart';

class UserProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.usb_rounded,
            size: 100,
            color: Colors.blue,
          ),
          SizedBox(height: 20),
          Text(
            'Welcome to profile',
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
