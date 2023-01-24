import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Login.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _textEditingController = TextEditingController();
  TextEditingController _passwordEditingController = TextEditingController();
  String? message;

  SignUp() async {
    try {
      final credintial = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _textEditingController.text,
              password: _passwordEditingController.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('Your password is weak');
      } else if (e.code == 'email-already-in-use') {
        print('Your email id already exist');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              TextField(
                controller: _textEditingController,
              ),
              TextField(
                controller: _passwordEditingController,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  SignUp();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
