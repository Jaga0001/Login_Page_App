import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassowordPage extends StatefulWidget {
  const ForgotPassowordPage({super.key});

  @override
  State<ForgotPassowordPage> createState() => _ForgotPassowordPageState();
}

class _ForgotPassowordPageState extends State<ForgotPassowordPage> {

  final _emailController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    super.dispose();
  }

  //* Reset Password Function
  Future resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.trim());
    } on FirebaseAuthException catch(e) {
      print(e);
      showDialog(context: context, builder: (context) {
        return AlertDialog(
          content: Text(e.message.toString()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        elevation: 0,
      ),

      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //* Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text('Enter your email, We\'ll send you reset password link', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),),
          ),

          SizedBox(height: 10),

          // *Email TextField
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email'
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 10,),

          //* Reset Password Button

          MaterialButton(
            elevation: 0,
            color: Colors.deepPurple[300],
            onPressed: (){
              resetPassword();
          }, child: Text('Reset Passoword'),)
        ],
      ),
    );
  }
}