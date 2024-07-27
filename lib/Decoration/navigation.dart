import 'package:flutter/material.dart';
import 'package:adaptive_navbar/adaptive_navbar.dart';
import 'package:guardian_angels/pages/about_us.dart';
import 'package:guardian_angels/pages/donation.dart';
import 'package:guardian_angels/pages/gaurdian_sign_up.dart';
import 'package:guardian_angels/pages/homepage.dart';
import 'package:guardian_angels/pages/profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _currentScreen = const WelcomeScreen(); // Default screen

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
                _currentScreen = const WelcomeScreen();
              });
            },
          ),
          NavBarItem(
            text: "Guardian Programme",
            onTap: () {
              setState(() {
                _currentScreen = const GaurdianSignUp();
              });
            },
          ),
          NavBarItem(
            text: "Profile",
            onTap: () {
              setState(() {
                _currentScreen = ProfilePage();
              });
            },
          ),
          NavBarItem(
            text: "Donation",
            onTap: () {
              setState(() {
                _currentScreen = const DonationScreen();
              });
            },
          ),
          NavBarItem(
            text: "About Us",
            onTap: () {
              setState(() {
                _currentScreen = const AboutUsScreen();
              });
            },
          ),
        ],
      ),
      body: _currentScreen,
    );
  }
}
