import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pch_app/screens/Onboarding_B.dart';
import 'package:pch_app/screens/Onboarding_C.dart';

class OnboardingA extends StatefulWidget {
  const OnboardingA({super.key});

  @override
  State<OnboardingA> createState() => _OnboardingAState();
}

class _OnboardingAState extends State<OnboardingA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
     body: Column(
       children: [
       Image.asset("assets/images/vector.png",width: 1200,fit: BoxFit.fill,color: Colors.pink.shade100),
         Image.asset("assets/images/pch1.png",width: 350, cacheHeight: 300, cacheWidth: 300, fit: BoxFit.fill,),
         SizedBox(height: 15,),
         Text("Building Solutions, Upholding Values.", style: GoogleFonts.aBeeZee(color: Colors.white, fontSize:20,fontWeight: FontWeight.bold ),),
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
                      color: index == 0? Colors.purpleAccent : Colors.white
                    ),
                 );
               },)
             ],
           ),
         ),
         SizedBox(height: 110,),
         GestureDetector(
           onTap: () {
             Navigator.push(
                 context,
               MaterialPageRoute(
                   builder: (context) => const OnboardingB()
               ),

             );
           },
           child: Container(
             padding: EdgeInsets.symmetric(horizontal: 150, vertical: 15),
             child: Text("Continue", style: GoogleFonts.aBeeZee(color: Colors.purpleAccent,fontSize: 20,fontWeight: FontWeight.bold),),
             decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.circular(10)

             ),
           ),
         )

       ]
     )



    );
  }
}
