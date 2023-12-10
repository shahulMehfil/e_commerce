import 'package:e_commerce/View/createscreen.dart';
import 'package:e_commerce/Model/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginscreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(36),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 139),
                  child: Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Please sign in to continue.',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 60,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 15.0, // soften the shadow
                        spreadRadius: 5.0, //extend the shadow
                      )
                    ],
                  ),
                  child: TextField(
                    controller: emailcontroller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20)),
                        hintText: 'Enter your email',
                        prefixIcon: Icon(
                          Icons.mail_outline_rounded,
                          size: 20,
                        )),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10.0, // soften the shadow3
                        spreadRadius: 2.0, //extend the shadow
                      )
                    ],
                  ),
                  child: TextField(
                    controller: passcontroller,
                    autofocus: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: 'Password',
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          size: 20,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                          color: Color.fromARGB(255, 16, 113, 192),
                          fontSize: 15),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 180,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: (() {
                            FirebaseAuth.instance.signInWithEmailAndPassword(
                                email: emailcontroller.text.trim(),
                                password: passcontroller.text.trim());
                          }),
                          child: Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 249, 247, 247),
                                  fontSize: 25),
                            ),
                          )),
                    ),
                    Text(
                      'Or',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    Center(
                      child: SignInButton(Buttons.Google, onPressed: () {
                        Firebasegoogleauth().signInWithGoogle();
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 110, left: 50),
                      child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Createpage(),
                            ));
                          },
                          child: Row(
                            children: [
                              Text(
                                'Dont have an account ?',
                                style: TextStyle(fontSize: 17),
                              ),
                              Text(
                                'Sign up',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 49, 114, 167),
                                    fontSize: 17),
                              )
                            ],
                          )),
                    )
                  ],
                ),
              ]),
        ));
  }
}
