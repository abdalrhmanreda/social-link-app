import 'package:flutter/material.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Welcome to Feeds!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
