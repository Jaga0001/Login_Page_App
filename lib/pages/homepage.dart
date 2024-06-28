import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:loginui/data/get_user_name.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  final user = FirebaseAuth.instance.currentUser!;


  List <String> docIds = [];

  Future getDocsIds() async {
    await FirebaseFirestore.instance.collection('users').orderBy('Last Name').get().then(
      (snapshot) => snapshot.docs.forEach(
        (document) {
          print(document.reference);
          docIds.add(document.reference.id);
        }
      )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signed In as ' + user.email!,
        style: TextStyle(fontSize: 15),),
        actions: [
          IconButton(onPressed: () {
            FirebaseAuth.instance.signOut();
          }, icon: Icon(Icons.logout))
        ],
      ),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          //* Display the Data Using Crud Operations

          Expanded(
            child: FutureBuilder(
              future: getDocsIds(), 
              builder: (context, snapshot) {
                return ListView.builder(
                  itemCount: docIds.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListTile(
                        leading: Icon(Icons.person),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        tileColor: Colors.black87,
                        title: GetUserName(documentId: docIds[index]),
                      ),
                    );
                  },
                );
              }
            )
          )
        ],
      )),
    );
  }
}