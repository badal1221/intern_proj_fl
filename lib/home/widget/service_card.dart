import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants.dart';
import '../../models/service.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({Key? key, required this.service, required this.index}) : super(key: key);
  final Service service;
  final int index;

  @override
  Widget build(BuildContext context) {
    return index%2==0?Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
          children: [
            SvgPicture.asset(service.image,height: 100,),
            const SizedBox(width: 10,),
            Expanded(
              child: Column(
                children: [
                  Text(
                    service.serviceTitle,
                    textAlign: TextAlign.center,
                    style:GoogleFonts.lexend(
                      color: primaryClr,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    service.serviceDesc,
                    textAlign: TextAlign.center,
                    maxLines: 5,
                    style:GoogleFonts.lexend(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
    )
        :Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
      children: [
          const SizedBox(width: 10,),
          Expanded(
            child: Column(
              children: [
                Text(
                  service.serviceTitle,
                  textAlign: TextAlign.center,
                  style:GoogleFonts.lexend(
                    color: primaryClr,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10,),
                Text(
                  service.serviceDesc,
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  style:GoogleFonts.lexend(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                )
              ],
            ),
          ),
          SvgPicture.asset(service.image,height: 100,),
      ],
    ),
        );
  }
}
