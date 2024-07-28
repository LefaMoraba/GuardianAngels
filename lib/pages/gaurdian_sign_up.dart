import 'package:flutter/material.dart';

class GuardianSignUpPage extends StatelessWidget {
  const GuardianSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 214, 187, 196),
      body: Center(
        child: SizedBox(
          width: 600,
          height: 600,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Requirements to be a Guardian Angel',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      '1. Must be 18 years or older.\n'
                      '2. Must pass a background check.\n'
                      '3. Must complete the Guardian Angels training program.\n'
                      '4. Must commit to volunteering at least 10 hours per month.\n'
                      '5. Must have a valid ID and contact information.\n',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'TO SIGN UP FOR THE GUARDIAN ANGEL SERVICE SEND AN EMAIL TO: 2359816@students.wits.ac.za\n',
                      style: TextStyle(
                        fontSize: 24,fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
