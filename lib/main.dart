import 'package:flutter/material.dart';
import 'package:pch_app/providers/auth_provider.dart';
import 'package:pch_app/screens/CreateAccount.dart';
import 'package:pch_app/screens/verifyOTP.dart';
import 'package:pch_app/screens/Onboarding_A.dart';
import 'package:pch_app/screens/Onboarding_B.dart';
import 'package:pch_app/screens/Onboarding_C.dart';
import 'package:pch_app/screens/SignIn.dart';
import 'package:pch_app/screens/Splash_Screen.dart';
import 'package:pch_app/screens/login.dart';
import 'package:pch_app/screens/verifying.dart';
import 'package:pch_app/screens/wallet.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (_) => AuthProvider(),
      child: MaterialApp(
        home: verifyOTP(),
        debugShowCheckedModeBanner: false,
      ),
    )
  );
}


