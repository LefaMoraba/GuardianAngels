import 'package:flutter/material.dart';
import 'package:guardian_angels/pages/login_page.dart';
import 'package:guardian_angels/pages/sign_up_page.dart';
import 'package:guardian_angels/features/splash_screen.dart';

void main() {
  runApp(const MyApp());
  //print("Configuring Amplify"); 
  //configureAmplify(); 
  //print("Configured Amplify"); 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Guardian Angels',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,  // Set the primary color to deep orange
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepOrange,  // Set the ElevatedButton color to deep orange
          ),
        ),
      ),
      routes: {
        '/': (context) => const SplashScreen(
              // Here, you can decide whether to show the LoginPage or HomePage based on user authentication
              child: LoginPage(),
            ),
        '/login': (context) => const LoginPage(),
        '/signUp': (context) => const SignUpPage()
      },
    );
  }
}