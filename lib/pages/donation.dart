import 'package:flutter/material.dart';

class DonationScreen extends StatelessWidget {
  const DonationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 214, 187, 196),
      body: Center(
        child: SizedBox(
          width: 600,
          height: 600,
          child:Card(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Donate from as little as R10! coming soon...', style: TextStyle(fontSize: 15, color: Colors.black)),
            Text('*All donations are given to guardians',style: TextStyle(fontSize: 10, color: Colors.red)),
          ],
        ),
          )
        )
      ),
    );
  }
}