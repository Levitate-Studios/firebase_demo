import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/screens/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier{
  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();

 bool loading=false;
 User? user;

  void loginUser(BuildContext context) async {
    loading=true;
    notifyListeners();
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passController.text.trim()
      );

      user=credential.user;
      loading=false;
      notifyListeners();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }

  }
}