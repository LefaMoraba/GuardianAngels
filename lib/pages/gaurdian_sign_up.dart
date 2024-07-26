import 'package:flutter/material.dart';

void main() {
  runApp(GaurdianSignUp());
}

class GaurdianSignUp extends StatefulWidget {
  const GaurdianSignUp({super.key});

  @override
  State<GaurdianSignUp> createState() => _GaurduanScreenState();
}

class _GaurduanScreenState extends State<GaurdianSignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _skillsController = TextEditingController();
  String _idError = '';

  @override
  void dispose() {
    _idController.dispose();
    _skillsController.dispose();
    super.dispose();
  }

  void _validateID(String id) {
    if (id.isEmpty) {
      setState(() {
        _idError = 'ID number is required';
      });
    } else if (id.length != 13 || !RegExp(r'^\d{13}$').hasMatch(id)) {
      setState(() {
        _idError = 'Enter a valid 13-digit ID number';
      });
    } else {
      setState(() {
        _idError = '';
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Perform the submission logic here
      // For now, just print the values
      print('ID: ${_idController.text}');
      print('Skills: ${_skillsController.text}');
      // Navigate to the Welcome Screen or show a success message
      // Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sign Up to be a Guardian'),
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
                    Text(
                      "Welcome To The Guardian Angels App",
                      style:
                          TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 200,
                      child: Image.asset('assets/b.png'),
                    ),
                    Text(
                      "Sign Up to be a Guardian",
                      style:
                          TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "We need your ID number to run a background check to ensure the safety of our patrons.",
                      style: TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _idController,
                      decoration: InputDecoration(labelText: 'ID Number'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'ID number is required';
                        } else if (value.length != 13 ||
                            !RegExp(r'^\d{13}$').hasMatch(value)) {
                          return 'Enter a valid 13-digit ID number';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        _validateID(value);
                      },
                    ),
                    Text(
                      _idError,
                      style: TextStyle(color: Colors.red),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _skillsController,
                      decoration: InputDecoration(
                          labelText: 'Skills (comma separated)'),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _submitForm,
                      child: Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
