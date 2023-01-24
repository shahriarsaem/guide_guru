import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:guide_guru/Idols/idol.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  List<String> _options = ['Bill Gates', 'Steve Jobs', 'Saem'];
  String? _selectedOption;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          title: Text('Guide Guru'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Profile Name'),
              ),
              ListTile(
                title: const Text('Contact'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('About'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Select your idol',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  for (var option in _options)
                    RadioListTile(
                      title: Text(option),
                      value: option,
                      groupValue: _selectedOption,
                      onChanged: (value) {
                        setState(() {
                          _selectedOption = value;
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => IdolScreen(idol_name: '$_selectedOption',)));
                      },
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
