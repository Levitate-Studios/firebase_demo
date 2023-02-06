import 'package:firebase_demo/providers/login_provider.dart';
import 'package:firebase_demo/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(

      builder: (context, loginProvider,_) {
        return Scaffold(
          body: Center(child: Text(loginProvider.user!.uid)),
        );
      }
    );
  }
}
