import 'package:flutter/material.dart';
import 'package:guardian_angels/pages/gaurdian_sign_up.dart';

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
          GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                          MaterialPageRoute(
                            builder: (context) => GaurdianSignUp()),
                            (route) => false);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Text(
                        "Sign up to be Gaurdian",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                    ),
          )    

        ],
      ),
    );
  }
}