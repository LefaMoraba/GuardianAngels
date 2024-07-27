import 'dart:html' as html;
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Register the view factory
    ui.platformViewRegistry.registerViewFactory(
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
      appBar: AppBar(
        title: Text('AWS Location Service Map'),
      ),
      body: HtmlElementView(viewType: 'map-html'),
    );
  }
}
