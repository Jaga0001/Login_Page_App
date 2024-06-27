import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class GetUserName extends StatelessWidget {

  final String documentId;

  GetUserName({super.key, required this.documentId});

  

  @override

  //* Get the Collection

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(), 
      builder: ((context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done) {
          Map <String, dynamic> data = snapshot.data!.data() as Map <String, dynamic>;

          return(Text('First Name: ${data['First Name']}'));
        } return Text('Loading');
      }),
    );
  }
}