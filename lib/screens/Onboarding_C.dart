import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pch_app/screens/CreateAccount.dart';
import 'package:pch_app/screens/login.dart';

class OnboardingC extends StatefulWidget {
  const OnboardingC ({super.key});

  @override
  State<OnboardingC> createState() => _OnboardingCState();
}

class _OnboardingCState extends State<OnboardingC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purpleAccent,
        body: Column(
            children: [
              Image.asset("assets/images/vector.png",width: 1200,fit: BoxFit.fill,color: Colors.pink.shade100,),
              Image.asset("assets/images/pch 3.png",width: 350, cacheHeight: 300, cacheWidth: 300, fit: BoxFit.fill),
              SizedBox(height: 15,),
              Text("Coding Beyond Limits", style: GoogleFonts.aBeeZee(color: Colors.white, fontSize:20,fontWeight: FontWeight.bold ),),
              SizedBox(height: 35,),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(3, (index) {
                      return Container(
                        width: index == 0? 15 : 15,
                        height: index == 0? 15 : 15,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2.5),
                            borderRadius: BorderRadius.circular(15),
                            color: index == 2? Colors.purpleAccent : Colors.white
                        ),
                      );
                    },)
                  ],
                ),
              ),
              SizedBox(height: 110,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => login(),
                          ),

                        );
                      },
                  child: Container(
                    height: 53,
                    width: double.infinity,
                    //padding: EdgeInsets.symmetric(horizontal: 120, vertical: 15),
                    child: Center(child: Text("Login", style: GoogleFonts.aBeeZee(color: Colors.purpleAccent,fontSize: 20,fontWeight: FontWeight.bold),)),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)

                    ),
                  ),
                ),
              )

            ]
        )



    );
  }
}
