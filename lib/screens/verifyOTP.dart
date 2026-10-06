import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pch_app/models/verifyOTP_model.dart';
import 'package:pch_app/screens/verifying.dart';
import 'package:pinput/pinput.dart';

class verifyOTP extends StatefulWidget {
  final _otpController = TextEditingController();
  final _userIdController = TextEditingController();
  final _emailController = TextEditingController();

  verifyOTP({super.key});

  @override
  State<verifyOTP> createState() => _verifyOTPState();
}

class _verifyOTPState extends State<verifyOTP
> {
  TextEditingController _Otp = TextEditingController();
  @override
  void initState() {
    super.initState();

    // Future.delayed(const Duration(seconds: 15), () {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => Verifying()
    //     ),
    //   );
    // } );
  }
  @override
  void dispose() {
    _Otp.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 64,
      height: 72,
      textStyle: GoogleFonts.inter(
        color: Colors.black, fontSize: 24, fontWeight: FontWeight.normal,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(8),
      )
    );
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 70,),
                  Center(
                    child: Text("Verify your Email", style: GoogleFonts.inter(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                  ),
                  Center(
                    child: Text("A 4-digit code was sent to james****", style: GoogleFonts.inter(color: Colors.black54,fontSize: 16,fontWeight: FontWeight.normal),),
                  ),
                  SizedBox(height: 55,),
                  Center(
                    child: Pinput(
                      length: 4,
                      controller: _Otp,
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          border: Border.all(
                            color: Colors.black,width: 1.5,
                          ),
                        ),
                      ),
                      submittedPinTheme: defaultPinTheme,
                      onCompleted: (pin) => print("Entered PIN: $pin"),
                    ),
                  ),
                    SizedBox(height: 30,),
                  Center(
                    child: TextButton(onPressed: () {},
                      style: TextButton.styleFrom( backgroundColor: Colors.grey.shade200,padding: EdgeInsetsGeometry.symmetric(
                        horizontal: 24, vertical: 12,
                      ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text("Resend Code in 01:33",style: GoogleFonts.inter(color: Colors.black,fontSize: 14,fontWeight: FontWeight.normal),),

                    ),
                  ),
                  SizedBox(height: 4,),
                  Center(
                    child: TextButton(onPressed: () {

                      final data = verifyOTPModel(
                        otp: _otpController.text.trim(),
                        userId: _userIdController.text.trim(),
                        email: _emailController.text.trim(),


                      );
                      print("This is the value ${_Otp.text}");
                      final success = await context.read<AuthProvider>().verifyOtp({_Otp.text});
                    },
                      child: Text("Verify via SMS", style: GoogleFonts.inter(color: Colors.black,fontSize: 14, fontWeight: FontWeight.bold),),
                    ),

                  )
                ],
              ),
            ),
          ),
      ),
    );
  }
}
