import 'package:flutter/material.dart';
import 'package:pch_app/screens/login.dart';
class Verifying extends StatefulWidget {
  const Verifying({super.key});

  @override
  State<Verifying> createState() => _VerifyingState();
}

class _VerifyingState extends State<Verifying> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => login()
        ),
      );
    } );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 100),
      Center(
        child: Text("Verifying your details...", style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold,),
        ),
      ),
      ],
      ),

    );


  }
}
