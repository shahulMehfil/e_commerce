import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/Model/firebase.dart';
import 'package:e_commerce/View/loginscreen.dart';

import 'package:flutter/material.dart';

TextEditingController signEmailController = TextEditingController();
TextEditingController signpasswordcontroller = TextEditingController();
TextEditingController signFullnameController = TextEditingController();
TextEditingController signPhonenumbercontroller = TextEditingController();

class Createpage extends StatefulWidget {
  Createpage({super.key});
  late List contacts;
  @override
  State<Createpage> createState() => _CreatepageState();
}

class _CreatepageState extends State<Createpage> {
  @override
  void dispose() {
    signEmailController.dispose();
    signpasswordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 145),
              child: Text(
                'Create Account',
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                    fontWeight: FontWeight.w900),
              ),
            ),
            SizedBox(
              height: 50,
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
                controller: signFullnameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Fullname',
                    prefixIcon: Icon(
                      Icons.account_circle_rounded,
                      size: 20,
                    )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10.0, // soften the shadow
                    spreadRadius: 2.0, //extend the shadow
                  )
                ],
              ),
              child: TextField(
                controller: signEmailController,
                autofocus: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: 'Email',
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      size: 20,
                    )),
              ),
            ),
            SizedBox(
              height: 10,
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
                controller: signPhonenumbercontroller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Phone Number',
                    prefixIcon: Icon(
                      Icons.lock_outline_rounded,
                      size: 20,
                    )),
              ),
            ),
            SizedBox(
              height: 10,
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
                controller: signpasswordcontroller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Password',
                    prefixIcon: Icon(
                      Icons.mail_outline_rounded,
                      size: 20,
                    )),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 175),
              child: SizedBox(
                height: 50,
                width: 180,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () async {
                      create();
                      Navigator.pop(context);
                    },
                    // Future<List> fetchAllContact() async {
                    //   List contactList = [];
                    //   DocumentSnapshot documentSnapshot =
                    //       await FirebaseFirestore.instance
                    //           .collection('e-commerce-d569d')
                    //           .doc('details')
                    //           .get();
                    //   contactList = documentSnapshot.data()[]
                    //   return contactList;
                    // }

                    // FirebaseAuth.instance.createUserWithEmailAndPassword(
                    //     email: signEmailController.text.trim(),
                    //     password: signpasswordcontroller.text.trim());
                    // Navigator.pop(context);
                    // Firestore().adduserdetails(
                    //   signFullnameController.text,
                    //   signEmailController.text,
                    //   signPhonenumbercontroller.text,
                    //   signpasswordcontroller.text,
                    // );

                    child: Center(
                      child: Text(
                        'sign up',
                        style: TextStyle(
                            color: Color.fromARGB(255, 249, 247, 247),
                            fontSize: 25),
                      ),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100, left: 50),
              child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Loginscreen(),
                    ));
                  },
                  child: Row(
                    children: [
                      Text(
                        'Already have an account ?',
                        style: TextStyle(fontSize: 17),
                      ),
                      Text(
                        'Sign in',
                        style: TextStyle(
                            color: Color.fromARGB(255, 49, 114, 167),
                            fontSize: 17),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
