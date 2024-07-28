import 'package:flutter/material.dart';
import 'package:guardian_angels/pages/homepage.dart';


class Guardian {
  final String name;
  final String surname;
  final List<String> skills;
  bool isSelected;

  Guardian({
    required this.name,
    required this.surname,
    required this.skills,
    this.isSelected = false,
  });
}

class GuardiansListScreen extends StatefulWidget {
  @override
  _GuardiansListScreenState createState() => _GuardiansListScreenState();
}

class _GuardiansListScreenState extends State<GuardiansListScreen> {
  List<Guardian> guardians = [
    Guardian(
      name: 'John',
      surname: 'Doe',
      skills: ['Training', 'Karate', 'First Aid', 'Self Defense', 'CPR'],
    ),
    Guardian(
      name: 'Jane',
      surname: 'Smith',
      skills: ['Martial Arts', 'Training', 'Survival Skills', 'Climbing', 'First Aid'],
    ),
    // Add more guardians here
  ];

  void _submitSelection() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Submission Successful'),
          content: Text('Your selection has been submitted successfully!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.of(context).pop(); // Leave the screen
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guardians List'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: guardians.length,
              itemBuilder: (context, index) {
                return GuardianItem(
                  guardian: guardians[index],
                  onChanged: (bool? value) {
                    setState(() {
                      guardians[index].isSelected = value ?? false;
                    });
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed:(){
                Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => WelcomeScreen() ), // Adjust to your actual HomeScreen
          (route) => false,
        );
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}

class GuardianItem extends StatelessWidget {
  final Guardian guardian;
  final ValueChanged<bool?> onChanged;

  GuardianItem({
    required this.guardian,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Checkbox(
                  value: guardian.isSelected,
                  onChanged: onChanged,
                ),
                Text(
                  '${guardian.name} ${guardian.surname}',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Text('Skills:', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 4.0),
            for (var skill in guardian.skills) Text(skill),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: GuardiansListScreen(),
  ));
}
