import 'package:firebase_demo/models/user_model.dart';
import 'package:firebase_demo/providers/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late RegisterProvider registerProvider;

  @override
  void initState() {
    super.initState();
    registerProvider = Provider.of<RegisterProvider>(context,listen: false);

  }

  ///outside build menthod
  ///PROVIDERCLASSNAME obejctName = Provider.of<PROVIDERCLASSNAME>(context,listen:false);
  ///
  ///inside build method
  ///Consumer widget
  ///PROVIDERCLASSNAME obejctName = Provider.of<PROVIDERCLASSNAME>(context);


  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterProvider>(

        builder: (context, registerProvider,_) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(hintText: 'name'),
                      controller: registerProvider.nameController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(hintText: 'email'),
                      controller: registerProvider.emailController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(hintText: 'mobile'),
                      controller: registerProvider.mobileController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(hintText: 'pass'),
                      controller: registerProvider.passController,
                    ),
                  ),
                  registerProvider.loading?CircularProgressIndicator():registerProvider.uploadIsSuccess?Text('User Registered'):ElevatedButton(
                    onPressed: () {

                      registerProvider.registerUser(context);
                    },
                    child: Text(
                      'Submit',
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
