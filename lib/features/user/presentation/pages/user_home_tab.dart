import 'package:flutter/material.dart';

class UserHomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.home,
            size: 100,
            color: Colors.blue,
          ),
          SizedBox(height: 20),
          Text(
            'Welcome to Home',
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
