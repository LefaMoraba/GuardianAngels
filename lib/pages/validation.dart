import 'package:flutter/material.dart';
import 'package:guardian_angels/Decoration/navigation.dart';
import 'package:guardian_angels/pages/sign_up_page.dart';
import 'package:guardian_angels/pages/homepage.dart';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';

class ValidationPage extends StatefulWidget {
  final String email;

  const ValidationPage({Key? key, required this.email}) : super(key: key);

  @override
  State<ValidationPage> createState() => _ValidationPageState();
}

class _ValidationPageState extends State<ValidationPage> {
  bool _isSigning = false;
  final TextEditingController _OTPController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _OTPController.dispose();
    super.dispose();
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('An Error Occurred'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  final userPool = CognitoUserPool(
    'us-east-1_tAiq6T7yb',
    '2ijodv5rg6ol780r31ejsjsgv4',
  );

  Future<void> Varify(String email, String OTP) async {
    final cognitoUser = CognitoUser(email, userPool);

    bool registrationConfirmed = false;
    try {
      registrationConfirmed = await cognitoUser.confirmRegistration(OTP);
      if (registrationConfirmed) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (route) => false,
        );
      } else {
        _showErrorDialog('Failed to confirm registration.');
      }
    } catch (e) {
      _showErrorDialog('An error occurred during verification: $e');
    }
  }

  Future<void> ResendOTP(String email) async{
    final cognitoUser = CognitoUser(email, userPool);
    final String status;
    try {
      status = await cognitoUser.resendConfirmationCode();
    } catch (e) {
      print(e);
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Varify(widget.email, _OTPController.text);
    }
  }

  void _getOTP() {
    if (_formKey.currentState!.validate()) {
      ResendOTP(widget.email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify Account"),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Welcome To The Guardian Angels App",
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 200,
                    child: Image.asset('assets/b.png'),
                  ),
                  const Text(
                    "Verify Account",
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: _OTPController,
                    decoration: const InputDecoration(labelText: 'OTP'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'OTP is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  if (_isSigning)
                    const CircularProgressIndicator()
                  else
                    GestureDetector(
                      onTap: _submitForm,
                      child: Container(
                        width: double.infinity,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            "Verify",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Didn't get the OTP?"),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: _getOTP,
                        child: const Text(
                          "Re-send",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
