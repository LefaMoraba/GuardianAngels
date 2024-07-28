import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Vision', style: TextStyle(fontSize: 15, color: Colors.white)),
            Text('Mission',
                style: TextStyle(fontSize: 25, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}