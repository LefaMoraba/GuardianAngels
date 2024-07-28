import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 214, 187, 196),
      body: Center(
        child: SizedBox(
          child:Card(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Vision', style: TextStyle(fontSize: 25, color: Colors.black)),
            Text('At Guardian Angels SA, our mission is to empower citizens with the tools and support they need to feel safe in their communities.\n'
                      'We believe that by leveraging technology and fostering a community of protectors, we can create a safer environment for everyone.\n',
                      style: TextStyle(
                        fontSize: 18,
                      ),),
            Text('Mission',style: TextStyle(fontSize: 25, color: Colors.black)),
            Text('We envision a South Africa where citizens can move freely and fearlessly,\n'
            'knowing they are supported by a network of trusted companions and cutting-edge technology designed to enhance their safety.\n'
                  'Join us in making South Africa a safer place for all. Together, we can walk towards a brighter, safer future.\n',
                      style: TextStyle(
                        fontSize: 18,
                      ),),
          ],
        ),
          )
        )
      ),
    );
  }
}