import 'package:flutter/material.dart';

class MyDevicesScreen extends StatelessWidget {
  const MyDevicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF5F6F8),
      child: const Center(
        child: Text(
          'My Devices Page',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF002B5B),
          ),
        ),
      ),
    );
  }
}
