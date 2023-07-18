import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/coupon.dart';

class CouponCard extends StatelessWidget {
  const CouponCard({Key? key, required this.coupon}) : super(key: key);
  final Coupon coupon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child:Image.asset(coupon.photo),
        ),
        Positioned(
          left: 15,
          top: 10,
          right: 140,
          child: Column(
            children: [
              Text(coupon.desc,
                textAlign: TextAlign.center,
                style: GoogleFonts.lexend(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10,),
              DottedBorder(
                borderType: BorderType.RRect,
                radius:const Radius.circular(5),
                dashPattern:const [10,4],
                strokeCap: StrokeCap.round,
                color: Color(0xFFF7E5B7),
                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(coupon.couponCode,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lexend(
                      color: Color(0xFFF7E5B7),
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}