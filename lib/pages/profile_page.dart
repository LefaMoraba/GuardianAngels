import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Update your profile!',
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
    );
  }
}