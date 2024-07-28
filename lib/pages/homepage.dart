import 'package:flutter/material.dart';
import 'package:guardian_angels/pages/gaurdians.dart';
import 'dart:html' as html;
//import 'dart:ui' as ui;
import 'dart:ui_web' as ui2;
import 'package:url_launcher/url_launcher.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

Future<void> sendEmail() async {
    final String subject = 'Emergency';
    final String body = 'Please help!!!';
    final String recipients = 'lefamoraba5751@gmail.com';
    final String cc = 'lukhonaxulu87@gmail.com';
    final String bcc = '2346902@students.wits.ac.za';

    final String mailtoLink = Uri(
      scheme: 'mailto',
      path: recipients,
      query: 'subject=$subject&body=$body&cc=$cc&bcc=$bcc',
    ).toString();

    if (await canLaunch(mailtoLink)) {
      await launch(mailtoLink);
    } else {
      throw 'Could not launch $mailtoLink';
    }
  }
  @override
  Widget build(BuildContext context) {
    // Register the view factory for the HTML map
    ui2.platformViewRegistry.registerViewFactory(
      'map-html',
      (int viewId) {
        final iframe = html.IFrameElement()
          ..src = 'assets/map.html' // Path to your HTML file
          ..style.border = 'none'
          ..style.width = '100%'
          ..style.height = '100%';
        return iframe;
      },
    );

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 214, 187, 196),
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,
        title: const Text('Where to?'),
      ),
      body: Column(
        children: [
          const Expanded(
            child: HtmlElementView(viewType: 'map-html'),
          ),
          SizedBox(
            height:40, // Adjust the height if necessary
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => GuardiansListScreen()), // Adjust to your actual HomeScreen
          (route) => false,
        );},
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.pink.shade100),
                    child: const Text('Request'),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: sendEmail,
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.pink.shade100),
                    child: const Text('SOS'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

