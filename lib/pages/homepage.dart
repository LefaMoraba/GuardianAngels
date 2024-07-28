import 'package:flutter/material.dart';
import 'dart:html' as html;
//import 'dart:ui' as ui;
import 'dart:ui_web' as ui2;

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

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
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.pink.shade100),
                    child: const Text('Request'),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
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

