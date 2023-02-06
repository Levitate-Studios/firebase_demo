import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/models/user_model.dart';
import 'package:firebase_demo/screens/login_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RegisterProvider with ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passController = TextEditingController();

  bool loading = false;
  bool uploadIsSuccess = false;

  registerUser(context) async {
    loading = true;
    notifyListeners();
    UserModel userModel = UserModel(
      name: nameController.text,
      email: emailController.text,
      mobile: mobileController.text,
    );

    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

    await FirebaseFirestore.instance
        .collection('users')
        .add(userModel.toJson());

    loading = false;
    uploadIsSuccess = true;
    notifyListeners();
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=> LoginScreen()));
  }
}
