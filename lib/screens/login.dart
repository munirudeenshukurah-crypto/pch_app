import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pch_app/screens/CreateAccount.dart';
import 'package:pch_app/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:pch_app/models/login_model.dart';
import 'package:pch_app/screens/CreateAccount.dart';
import 'package:pch_app/screens/verifyOTP.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AuthProvider>();
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
                    TextSpan(
                      recognizer: TapGestureRecognizer()..onTap = () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => Createaccount()
                        )
                        );
                      },
                        text: " Create Account", style: TextStyle(color: Colors.purpleAccent)),
                  ]
                )
            ),
          ),
          SizedBox(height: 50,),
          // Email or Phone Number Field
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text('Email or Phone Number', style: TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold), textAlign: TextAlign.right,),
          ),
          SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: "Email or Phone Number",
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 22),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                        color: Colors.purpleAccent,
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
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text("Password", style: TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold), textAlign: TextAlign.right,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: _passwordController,
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
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text("Forgot Password", style: TextStyle(color: Colors.purpleAccent, fontSize: 18, fontWeight: FontWeight.bold),),
          ),
          SizedBox(height: 55,),
          // Login Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
               onTap: () async {
            final data = LoginModel(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),

             );

            print('This is our login data: $data');

            final success = await context.read<AuthProvider>().login(data);

            if (success) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login successful ${provider.successMessage}')));

            }
               },

              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 25),
                decoration: BoxDecoration(
                  color: Colors.purpleAccent,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: provider.isloading? Center(child: CircularProgressIndicator(color: Colors.white,)) : Center(
                    child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
