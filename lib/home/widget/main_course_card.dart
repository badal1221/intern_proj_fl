import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/dish.dart';

class MainCourseCard extends StatelessWidget {
  const MainCourseCard({Key? key,required this.dish}) : super(key: key);
  final Dish dish;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(20),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                child:Image.asset(dish.photo,)
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(dish.dishName,
                textAlign: TextAlign.center,
                style: GoogleFonts.lexend(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}