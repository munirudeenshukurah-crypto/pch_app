import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pch_app/screens/Onboarding_A.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const OnboardingA()
        ),
      );
    } );
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      body: Center(
          child: Text("Project Code Hijabi", style: GoogleFonts.kavoon(color: Colors.white, fontStyle: FontStyle.italic, fontSize: 36, fontWeight: FontWeight.bold ),)),

    );
  }
}