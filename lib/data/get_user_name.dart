import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GetUserName extends StatelessWidget {

  final String documentId;

  GetUserName({super.key, required this.documentId});

  

  @override

  //* Get the Collection

  // ignore: override_on_non_overriding_member
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(), 
      builder: ((context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done) {
          Map <String, dynamic> data = snapshot.data!.data() as Map <String, dynamic>;
          return(Text('Last Name: ${data['Last Name']}',style: TextStyle(fontWeight: FontWeight.w900, color: Colors.white70),));
        } return Text('Loading');
      }),
    );
  }
}
