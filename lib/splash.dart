import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quiz_app/home.dart';
class splashscreen extends StatefulWidget {
  const splashscreen({Key? key}) : super(key: key);
  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const homepage(),
      ));
  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "images/ipl.png",),
              fit:BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
