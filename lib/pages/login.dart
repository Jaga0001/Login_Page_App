import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginui/pages/forgotPassoword_page.dart';

class Login extends StatefulWidget {

  final VoidCallback showRegisterPage;
  const Login({super.key, required this.showRegisterPage});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  
  final _emailController = TextEditingController();

  final _passwordController =  TextEditingController();

  Future <void> signIn() async {

    //* Circular Progress Indicator

    showDialog(
      context: context,
      builder: (context) {
        return Center(child: CircularProgressIndicator());
      },
    );

    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(), 
      password: _passwordController.text.trim()
    );

    Navigator.of(context).pop();
  }


  @override
  void dispose() {

    _emailController.dispose();
    _passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.lock, size: 100,),
                SizedBox(height: 25),
                //Hello Again
                // Text('Hello Again!',
                // style: GoogleFonts.bebasNeue(
                //   fontSize: 52
                // ),
            
                AnimatedTextKit(animatedTexts: [
                  TyperAnimatedText(
                    'Hello Again',
                    textStyle: GoogleFonts.bebasNeue(fontSize: 52),
                    speed: const Duration(milliseconds: 200), 
                    ),
                  ],
                  totalRepeatCount: 30,
                  displayFullTextOnTap: true,
            
                ),
                SizedBox(height: 10),
                Text('Welcome back, You \'ve been missed!',
                style: TextStyle(
                    fontSize: 16
                  ),
                ),
                SizedBox(height: 50),
            
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
            
                SizedBox(height: 10),

                // *Password TextField
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
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password'
                        ),
                      ),
                    ),
                  ),
                ),
            
                SizedBox(height: 10),

                //* Forgot Password Button

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassowordPage()));
                        },
                        child: Text('Forgot Password', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple))
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10),

                // *SignIn Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: signIn,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(12)
                      ),
                    
                      child: Center(child: Text('Sign In', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),)),
                    ),
                  ),
                ),
            
                SizedBox(height: 25),
                
                
                // *Not a SignIn Text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not a Member?'),

                    GestureDetector(
                      onTap: widget.showRegisterPage,
                      child: Text(' Register Now', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple),)
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}