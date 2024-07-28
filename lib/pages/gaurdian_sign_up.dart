// guardian_sign_up.dart
import 'package:flutter/material.dart';

class GuardianSignUpPage extends StatelessWidget {
  const GuardianSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guardian Angel Requirements'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Requirements to be a Guardian Angel',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '1. Must be 18 years or older.\n'
              '2. Must pass a background check.\n'
              '3. Must complete the Guardian Angels training program.\n'
              '4. Must commit to volunteering at least 10 hours per month.\n'
              '5. Must have a valid ID and contact information.\n'
              ,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'TO SIGN UP FOR THE GUARDIAN ANGEL SERVICE SEND AN EMAIL TO: \n'
              '2359816@students.wits.ac.za\n'
              ,
              style: TextStyle(
                fontSize: 25,
              ),)
          ],
        ),
      ),
    );
  }
}
