import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/default_menu.dart';

class DefaultMenuCard extends StatelessWidget {
  const DefaultMenuCard({Key? key, required this.menu}) : super(key: key);
  final DefaultMenuItems menu;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left:25,bottom: 10),
          child: Container(
            height: 220,
            width: 220,
            decoration: BoxDecoration(
              borderRadius:BorderRadius.circular(18),
            ),
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(18),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Default Menu 1',
                      style:GoogleFonts.lexend(
                        color: Color(0xFF242424),
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15).copyWith(left: 75),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('3 starters ',
                            style: GoogleFonts.lexend(
                              color: Color(0xFF242424),
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text('3 maincourse ',
                            style: GoogleFonts.lexend(
                              color: Color(0xFF242424),
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text('3 dessert ',
                            style: GoogleFonts.lexend(
                              color: Color(0xFF242424),
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text('3 drinks',
                            style: GoogleFonts.lexend(
                              color: Color(0xFF242424),
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                            ),
                          )
                        ],
                      ),

                    ),
                    const SizedBox(
                      width: 120,
                      child:Row(
                        children: [
                          Icon(Icons.person,size: 20,),
                          SizedBox(width: 5,),
                          Text('Min 800', style: TextStyle(
                            color: Color(0xFF7E7E7E),
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                    const Text('Starts at ₹777',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Color(0xFF6318AF),
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top:50,
          left:-5,
          child:Image.asset('assets/images/menuPic.png',height: 100,),),
      ],
    );
  }
}