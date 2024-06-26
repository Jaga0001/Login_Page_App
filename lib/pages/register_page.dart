import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({super.key, required this.showLoginPage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _emailController = TextEditingController();
  final _passwordController =  TextEditingController();
  final _confirmPasswordController = TextEditingController();

  //* Creating Addtional Fields For Database

  final _firstNameController = TextEditingController();
  final _lastNameController  = TextEditingController();
  final _ageController = TextEditingController();
  final snackBar = SnackBar(content: Text('Password are not Same'));

  Future signup() async {
    if (paswwordConfirmed()) {

      //* Create User
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(), 
        password: _passwordController.text.trim(),
        );

      //* Add User Details
      addUserDetails(
        _firstNameController.text.trim(), 
        _lastNameController.text.trim(), 
        _emailController.text.trim(), 
        int.parse(_ageController.text.trim())
      );


    } else {
      return ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future addUserDetails(String firstName, lastName, email, int age) async{
    await FirebaseFirestore.instance.collection('users').add({
      'First Name': firstName,
      'Last Name':  lastName,
      'Age':  age,
      'Email': email, 
    });
  }

  bool paswwordConfirmed() {
    if (_passwordController.text.trim() == _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
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
                
                //Hello Again
                // Text('Hello Again!',
                // style: GoogleFonts.bebasNeue(
                //   fontSize: 52
                // ),
            
                AnimatedTextKit(animatedTexts: [
                  TyperAnimatedText(
                    'Hello There',
                    textStyle: GoogleFonts.bebasNeue(fontSize: 52),
                    speed: const Duration(milliseconds: 200), 
                    ),
                  ],
                  totalRepeatCount: 30,
                  displayFullTextOnTap: true,
            
                ),
                SizedBox(height: 10),
                Text('Register below with your Details!',
                style: TextStyle(
                    fontSize: 16
                  ),
                ),
                SizedBox(height: 50),



                // *First Name TextField
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
                        controller: _firstNameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'First Name'
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10),

                // *Last Name TextField
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
                        controller: _lastNameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Last Name'
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10),

                // *Age TextField
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
                        controller: _ageController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Age'
                        ),
                      ),
                    ),
                  ),
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

                //* Confirm Password Field
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
                        controller: _confirmPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Confirm Password'
                        ),
                      ),
                    ),
                  ),
                ),
            
                SizedBox(height: 10),


                // *SignIn Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: signup,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(12)
                      ),
                    
                      child: Center(child: Text('Sign Up', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),)),
                    ),
                  ),
                ),
            
                SizedBox(height: 25),
                
                
                // *Not a SignIn Text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('I am a Member? '),
                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: Text('Login In', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple),)
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