import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class IdolScreen extends StatefulWidget {
  const IdolScreen({required this.idol_name});
  final String idol_name;

  @override
  State<IdolScreen> createState() => _IdolScreenState();
}

class _IdolScreenState extends State<IdolScreen> {
  TextEditingController _bios = TextEditingController();
  Future getBio() async {
// ...

    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// Fetch all documents in a collection
    _firestore.collection('Bios').get().then((snapshot) {
      for (var document in snapshot.docs) {
        _bios = document.data() as TextEditingController;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.idol_name}'),
      ),
      body: ListView(
        children: [
          Text(_bios.text),
        ],
      ),
    );
  }
}
