import 'package:flutter/material.dart';
import 'package:adaptive_navbar/adaptive_navbar.dart';
import 'package:guardian_angels/pages/about_us.dart';
import 'package:guardian_angels/pages/donation.dart';
import 'package:guardian_angels/pages/gaurdian_sign_up.dart';
import 'package:guardian_angels/pages/homepage.dart';
import 'package:guardian_angels/pages/profile.dart';
//import 'package:guardian_angels/pages/welcome_screen.dart'; // Import the new WelcomeScreen

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _currentScreen =  WelcomeScreen(); // Default screen is the WelcomeScreen

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AdaptiveNavBar(
        screenWidth: sw,
        title: const Text("Guardian Angels"),
        navBarItems: [
          NavBarItem(
            text: "Home",
            onTap: () {
              setState(() {
                _currentScreen =  WelcomeScreen(); // Navigate to WelcomeScreen
              });
            },
          ),
          NavBarItem(
            text: "Guardian Programme",
            onTap: () {
              setState(() {
                _currentScreen = const GaurdianSignUp(); // Navigate to GaurdianSignUp
              });
            },
          ),
          NavBarItem(
            text: "Profile",
            onTap: () {
              setState(() {
                _currentScreen = ProfilePage(); // Navigate to ProfilePage
              });
            },
          ),
          NavBarItem(
            text: "Donation",
            onTap: () {
              setState(() {
                _currentScreen = const DonationScreen(); // Navigate to DonationScreen
              });
            },
          ),
          NavBarItem(
            text: "About Us",
            onTap: () {
              setState(() {
                _currentScreen = const AboutUsScreen(); // Navigate to AboutUsScreen
              });
            },
          ),
        ],
      ),
      body: _currentScreen,
    );
  }
}
