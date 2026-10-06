import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 120,),
          Center(
              child: Text("Sign in", style: GoogleFonts.inter(color: Colors.black, fontSize: 35,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)),
          Center(
            child: RichText(
                text: TextSpan(
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal
                    ),
                    children: [
                      TextSpan(text: "Don't have an account?", style: TextStyle(color: Colors.black)),
                      TextSpan(text: " Create Account", style: TextStyle(color: Colors.purpleAccent)),
                    ]
                )
            ),
          ),
          SizedBox(height: 50,),
          // Email or Phone Number Field
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(  'Email or Phone Number', style: TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold), textAlign: TextAlign.right,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Hemmymme@gmail.com",
                  errorText:"Incorrect email",
                  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 22),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                        color: Colors.red, width: 2.0,
                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: Colors.grey, width: 2.0)
                  )
              ) ,
            ),
          ),
          SizedBox(height: 10,),
          // Password Field
          Text("Password", style: TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold),),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              obscureText: isHidden,
              decoration: InputDecoration(
                  hintText: "Password",
                  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 22),
                  suffixIcon: IconButton(onPressed: () {
                    setState(() {
                      isHidden = !isHidden;
                    });
                  }, icon: isHidden? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                        color: Colors.purpleAccent,
                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                  )
              ) ,
            ),
          ),
          SizedBox(height:10,),
          Text(  "Forgot Password", style: TextStyle(color: Colors.purpleAccent, fontSize: 18, fontWeight: FontWeight.bold),),
          SizedBox(height: 55,),
          // Login Button
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 25),
              decoration: BoxDecoration(
                color: Colors.purpleAccent,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                  child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)),
            ),
          ),
        ],
      ),
    );
  }
}