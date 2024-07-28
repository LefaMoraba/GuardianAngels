import 'package:flutter/material.dart';
import 'package:guardian_angels/pages/login_page.dart';
import 'package:guardian_angels/Decoration/navigation.dart';
//import 'package:amplify_flutter/amplify.dart';
//import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  @override
  State<SignUpPage> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fNameController = TextEditingController();
  final TextEditingController _lNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true, buttonPressed = true;
  String _fNameError = '';
  String _lNameError = '';
  String _emailError = '';
  String _passwordError = '';

  @override
  void dispose() {
    _fNameController.dispose();
    _lNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _validateName(String name) {
    if (name.isEmpty) {
      setState(() {
        _fNameError = 'Name is required';
      });
    } else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(name)) {
      setState(() {
        _fNameError = 'Enter a valid name';
      });
    } else if (name.length < 2) {
      setState(() {
        _fNameError = 'Name must be at least 2 characters';
      });
    } else {
      setState(() {
        _fNameError = '';
      });
    }
  }

  void _validateSurname(String surname) {
    if (surname.isEmpty) {
      setState(() {
        _lNameError = 'Surname is required';
      });
    } else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(surname)) {
      setState(() {
        _lNameError = 'Enter a valid surname';
      });
    } else if (surname.length < 2) {
      setState(() {
        _lNameError = 'Surname must be at least 2 characters';
      });
    } else {
      setState(() {
        _lNameError = '';
      });
    }
  }

  void _validateEmail(String email) {
    if (email.isEmpty) {
      setState(() {
        _emailError = 'Email is required';
      });
    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(email)) {
      setState(() {
        _emailError = 'Enter a valid email address';
      });
    } else {
      setState(() {
        _emailError = '';
      });
    }
  }

  void _validatePassword(String password) {
    if (password.isEmpty) {
      setState(() {
        _passwordError = 'Password is required';
      });
    } else if (password.length < 6) {
      setState(() {
        _passwordError = 'Password must be at least 6 characters';
      });
    } else {
      setState(() {
        _passwordError = '';
      });
    }
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

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final userPool = CognitoUserPool(
    'us-west-1_S65cJX68p',
    '5176idlu4cdrdj9vvuv1rc5ip7',
  );

  Future<void> signup(String name, String surname, String email, String password) async {
    final userAttributes = [
      AttributeArg(name: 'given_name', value: name),
      AttributeArg(name: 'family_name', value: surname),
    ];

    try {
      await userPool.signUp(email, password, userAttributes: userAttributes);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
        (route) => false,
      );
    } catch (e) {
      _showErrorDialog('An error occurred during sign-up: $e');
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      signup(_fNameController.text, _lNameController.text, _emailController.text, _passwordController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up Page'),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Form(
              key: _formKey,
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
                    "Sign Up",
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    controller: _fNameController,
                    decoration: const InputDecoration(labelText: 'First Name'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'First Name is required';
                      } else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                        return 'Enter a valid first name';
                      } else if (value.length < 2) {
                        return 'First name must be at least 2 characters';
                      }
                      return null;
                    },
                  ),
                  Text(
                    _fNameError,
                    style: const TextStyle(color: Colors.red),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _lNameController,
                    decoration: const InputDecoration(labelText: 'Last Name'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Last name is required';
                      } else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                        return 'Enter a valid last name';
                      } else if (value.length < 2) {
                        return 'Last name must be at least 2 characters';
                      }
                      return null;
                    },
                  ),
                  Text(
                    _lNameError,
                    style: const TextStyle(color: Colors.red),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email is required';
                      } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(value)) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  Text(
                    _emailError,
                    style: const TextStyle(color: Colors.red),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        icon: _obscureText ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                        onPressed: _togglePasswordVisibility,
                      ),
                    ),
                    obscureText: _obscureText,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password is required';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  Text(
                    _passwordError,
                    style: const TextStyle(color: Colors.red),
                  ),
                  const SizedBox(height: 20),
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
                          "Sign Up",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginPage()),
                            (route) => false,
                          );
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
