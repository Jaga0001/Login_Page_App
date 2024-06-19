import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.android, size: 100,),
              SizedBox(height: 25),
              //Hello Again
              Text('Hello Again!',
              style: GoogleFonts.bebasNeue(
                fontSize: 52
              ),
              ),
              SizedBox(height: 10),
              Text('Welcome back, You \'ve been missed!',
              style: TextStyle(
                  fontSize: 16
                ),
              ),
              SizedBox(height: 50),
          
              //Email TextField
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
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email'
                      ),
                    ),
                  ),
                ),
              ),
          
              SizedBox(height: 10),
              //Password TextField
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
              //SignIn Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
          
              SizedBox(height: 25),
              //Not a SignIn Text

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not a Member?'),
                  Text(' Register Now', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}