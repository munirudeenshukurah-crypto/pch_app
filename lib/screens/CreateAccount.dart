import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pch_app/models/createaccount_model.dart';
import 'package:pch_app/screens/login.dart';
import 'package:pch_app/providers/auth_provider.dart';
import 'package:pch_app/screens/verifyOTP.dart';
import 'package:provider/provider.dart';

class Createaccount extends StatefulWidget {
   Createaccount({super.key});


  @override
  State<Createaccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<Createaccount> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();
  final _addressController = TextEditingController();

  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AuthProvider>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Text("Create Account", style: GoogleFonts.inter(color: Colors.black, fontSize: 35,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)),
            Center(
              child: RichText(
                  text: TextSpan(
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal
                      ),
                      children: [
                        TextSpan(text: "Alrealdy have an account?", style: TextStyle(color: Colors.black)),
                        TextSpan(
                            recognizer: TapGestureRecognizer()..onTap = () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => login()
                              )
                              );
                            },
                            text: " Login", style: TextStyle(color: Colors.purpleAccent)),
                      ]
                  )
              ),
            ),
            SizedBox(height: 20,),
            // Full name Field
        
            SizedBox(height: 4,),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text('First name', style: TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold), textAlign: TextAlign.right,),
            ),
            SizedBox(height: 4,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _firstNameController,
                decoration: InputDecoration(
                    hintText: "Enter your first name",
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
            ),Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text('Last name', style: TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold), textAlign: TextAlign.right,),
            ),
            SizedBox(height: 4,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _lastNameController,
                decoration: InputDecoration(
                    hintText: "Enter your last name",
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
            SizedBox(height: 4,),
            // Email Field
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text("Email", style: TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold), textAlign: TextAlign.right,),
            ),
            SizedBox(height: 4,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    hintText: "Enter your email address",
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 22),
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
            SizedBox(height: 4,),
            // Phone Number Field
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text('Phone Number', style: TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold), textAlign: TextAlign.right,),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: IntlPhoneField(
                controller: _phoneNumberController,
                decoration: InputDecoration(
                    labelText: "000 0000000",
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
                    ),
                ) ,
                initialCountryCode: 'US',
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
              ),
            ),
            // Password Field
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                  "Password", style: TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold), textAlign: TextAlign.right,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _passwordController,
                obscureText: isHidden,
                decoration: InputDecoration(
                    hintText: "Enter your password",
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
            SizedBox(height: 4,),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Address", style: TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold), textAlign: TextAlign.right,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _addressController,
                decoration: InputDecoration(
                    hintText: "Enter your address",
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 22),
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
        
            SizedBox(height: 40,),
            // Create Account Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  verifyOTP()
                      ),
        
                    );
                  },
                child: GestureDetector(
                  onTap: () async {
                    final data = CreateAccountModel(
                        firstName: _firstNameController.text.trim(),
                        lastName: _lastNameController.text.trim(),
                        email: _emailController.text.trim(),
                        password: _passwordController.text.trim(),
                        phoneNumber: _phoneNumberController.text.trim(),
                        address: _addressController.text.trim(),

                    );

                    print('This is our account creation data: $data');

                    final success = await context.read<AuthProvider>().createaccount(data);

                    if (success) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Account created successfully, awaiting otp verification ${provider.successMessage}'), duration: Duration(seconds: 5),));
                      await Future.delayed(Duration(seconds: 5));
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => verifyOTP()));
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 25),
                    decoration: BoxDecoration(
                      color: Colors.purpleAccent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: provider.isloading? Center(child: CircularProgressIndicator(color: Colors.white,)) : Center(
                        child: Text("Create Account", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}