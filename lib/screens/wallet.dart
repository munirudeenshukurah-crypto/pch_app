import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class wallet extends StatefulWidget {
  const wallet({super.key});

  @override
  State<wallet> createState() => _walletState();
}

class _walletState extends State<wallet> {
  final List<String> wallets = [
    "NGN",
    "USD",
    "EUR",
  ];
  int selectedIndex = 0;
  bool isBalanceVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
              width: double.infinity,
              height: 450,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xff004D40),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                )
              ),
              child: Column(
                children: [
                 Row(
                   children: [
                     SafeArea(
                       child: Container(
                         width: 50,
                         height: 50,
                         decoration: BoxDecoration(
                           border: Border.all(
                             color: Colors.white, width: 2.0,
                           ),
                           borderRadius: BorderRadius.circular(50),
                           image: DecorationImage(image: AssetImage("assets/images/Profile.jpg"), fit: BoxFit.cover),
                         ),

                       ),

                     ),
                     SizedBox(width: 10),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text("Hello,", style: TextStyle(color: Colors.white70, fontSize: 16, fontWeight: FontWeight.bold),),
                         Text("Shukurah", style: TextStyle(color: Colors.white70, fontSize: 16, fontWeight: FontWeight.bold),),
                       ],
                     ),
                     Spacer(),
                     Container(
                       height: 50,
                       width: 50,
                       padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                       decoration: BoxDecoration(
                         color: Colors.green.shade100.withOpacity(0.2),
                         borderRadius: BorderRadius.circular(12),
                       ),
                       child: Icon(Icons.notifications, color: Colors.lime.shade300, size: 35,),
                     )
                   ],

                 ),
                  SizedBox(height:20),
                  Text("Your Wallet Balance", style: TextStyle(color: Colors.lime.shade300.withOpacity(0.7), fontSize: 18, fontWeight: FontWeight.normal),),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 80),
                        child: Text(
                          isBalanceVisible
                        ?"\u{20A6}209,891.21"
                        :"\u{20A6}**********",
                        style: TextStyle(color: Colors.grey.shade100, fontSize: 34, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(width: 10,),
                      IconButton(onPressed: () {
                        setState(() {
                          isBalanceVisible = ! isBalanceVisible;

                        });
                      }, icon: isBalanceVisible ? Icon(PhosphorIcons.eyeClosed()) : Icon(PhosphorIcons.eye()),iconSize: 30,
                        color: Colors.lime.shade300,
                      ),

                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     ElevatedButton(
                       onPressed: () {},
                       style: ElevatedButton.styleFrom(
                         fixedSize: Size(110, 30),
                         backgroundColor: Colors.lime.shade300,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(13),
                         ),
                       ),
                       child: Text("Fund", style: TextStyle( color: Color(0xff004D40), fontSize: 18, fontWeight: FontWeight.bold),),
                     ),
                      SizedBox(width: 15),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(110, 30),
                          backgroundColor: Colors.lime.shade300,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                          )
                        ),
                        child: Text("Send", style: TextStyle( color: Color(0xff004D40), fontSize: 18, fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Container(
                    width: 400,
                    height: 105,
                    decoration: BoxDecoration(
                      color: Colors.green.shade100.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Text("Your Wallet", style: TextStyle(color: Colors.white70, fontSize: 17, fontWeight: FontWeight.bold,),),
                        ),
                        SizedBox(height: 6),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                             children: [
                               ...List.generate(
                                 wallets.length, (index) {
                                 return GestureDetector(
                                   onTap: () {
                                     setState(() {
                                       selectedIndex = index;
                                     });
                                   },
                                   child: Container(
                                     padding: EdgeInsets.symmetric(
                                       horizontal: 15,
                                       vertical: 9,
                                     ),
                                     decoration: BoxDecoration(
                                       color: selectedIndex == index
                                           ? Colors.lime.shade300
                                           :Colors.green.shade300.withOpacity(0.1),
                                       borderRadius: BorderRadius.circular(12),
                                       border: Border.all(
                                         color: Colors.white, width: 0.5,
                                       ),
                                     ),
                                     child: Text(
                                       wallets[index], style: TextStyle(color: selectedIndex == index
                                         ? Color(0xff004D40)
                                         : Colors.white, fontWeight: FontWeight.bold,
                                     ),
                                     ),
                                   ),
                                 );
                               },
                               ),
                               GestureDetector(
                                 onTap: () {
                                   print("Add Wallet");
                                 },
                                 child: Container(
                                   padding: EdgeInsets.symmetric(
                                     horizontal: 7,
                                     vertical: 8,
                                   ),
                                   decoration: BoxDecoration(color: Colors.teal.shade900,
                                     borderRadius: BorderRadius.circular(10),
                                   ),
                                   child: Padding(
                                     padding: const EdgeInsets.symmetric(horizontal: 7),
                                     child: Row(
                                       mainAxisSize: MainAxisSize.min,
                                       children: [
                                        Icon(Icons.add_circle_outline, size: 20, color: Colors.white70,),
                                         SizedBox(width: 5,),
                                         Text("Add Wallet", style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),),
                                       ],
                                     ),
                                   ),
                                 ),
                               ),
                             ],


                            ),
                        ),

                      ],
                    )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}
