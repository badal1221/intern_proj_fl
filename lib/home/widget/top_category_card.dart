import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/category.dart';

class TopCategoryCard extends StatelessWidget {
  const TopCategoryCard({Key? key, required this.category}) : super(key: key);
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(category.photo,height: 70,),
        Text(
          category.categoryName,
          style:GoogleFonts.lexend(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.w300,
          ),
        )
      ],
    );
  }
}
