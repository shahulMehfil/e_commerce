import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../View/createscreen.dart';

class Firebasegoogleauth {
  final _googleSignIn = GoogleSignIn();

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signOut() async {
    FirebaseAuth.instance.signOut();
    await _googleSignIn.signOut();
  }
}

// class Firestore {
//   Future adduserdetails(String name,String email,String number,String password) async {
//     await FirebaseFirestore.instance
//         .collection('samples')
//         .add({"name": name, "email": email,"number":number,"password":password});
//   }
// }
Future<dynamic> create() async {
  try {
    final userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: signEmailController.text,
            password: signpasswordcontroller.text);
    final city = <String, String>{
      "name": signFullnameController.text,
      "Email": signEmailController.text,
      "Phone number": signPhonenumbercontroller.text,
    };
    FirebaseFirestore.instance
        .collection("User data")
        .doc(userCredential.user!.uid)
        .set(city);
  } catch (e) {
    debugPrint('error$e');
  }
}

Stream<Map<String, dynamic>> getUserData() async* {
  final User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    yield* FirebaseFirestore.instance
        .collection('User data')
        .doc(user.uid)
        .snapshots()
        .map((documentSnapshot) {
      if (documentSnapshot.exists) {
        final data = documentSnapshot.data() as Map<String, dynamic>;

        // print(user.uid);

        return data;
      } else {
       
        throw StateError('User data does not exist');
      }
    });
  } else {
    throw StateError('User is not authenticated');
  }
}
