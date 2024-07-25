import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned(
            top: 20, // Adjust the position from the top
            left: 20, // Adjust the position from the left
            child: Tooltip(
              message: 'More', // Tooltip message
              child: Icon(
                Icons.more_vert_outlined, // You can choose any icon from the Icons class
                size: 40.0, // Adjust the size as needed
              ),
            ),
          ),
          Center(
            child: Text(
              'Welcome!',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
        ],
      ),
    );
  }
}