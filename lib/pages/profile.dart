import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/background.jpg', // Path to your background image
              fit: BoxFit.cover,
            ),
          ),
          const Center(
            child: SizedBox(
              width: 600,
              child: Card(
                //child: ProfileForm(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


