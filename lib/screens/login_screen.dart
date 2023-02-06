import 'package:firebase_demo/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(

      builder: (context, loginProvider,_) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(hintText: 'email'),
                    controller: loginProvider.emailController,
                  ),
                ),
               
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(hintText: 'pass'),
                    controller: loginProvider.passController,
                  ),
                ),
                loginProvider.loading?CircularProgressIndicator():ElevatedButton(
                  onPressed: () {

                    loginProvider.loginUser(context);
                  },
                  child: Text(
                    'Submit',
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
