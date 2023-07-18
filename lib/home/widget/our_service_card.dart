import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';
import '../../models/our_services.dart';

class OurServiceCard extends StatelessWidget {
  const OurServiceCard({Key? key, required this.service,}) : super(key: key);
  final OurService service;
  // final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width-25,
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(5),
        child:Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child:Image.asset( service.image,)
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      Image.asset(service.logo),
                      const SizedBox(width: 10,),
                      Text(service.serviceTitle,
                        style:GoogleFonts.lexend(
                          color:primaryClr,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/sparkles.svg'),
                      const SizedBox(width: 10,),
                      Text(service.serviceDesc1,
                        style: TextStyle(fontSize: 15),
                        maxLines: 2,),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/sparkles.svg'),
                      const SizedBox(width: 10,),
                      Text(service.serviceDesc2,
                        style: TextStyle(fontSize: 15),
                        maxLines: 2,),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/sparkles.svg'),
                      const SizedBox(width: 10,),
                      Text(service.serviceDesc3,
                        style: TextStyle(fontSize: 15),
                        maxLines: 2,),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/sparkles.svg'),
                      const SizedBox(width: 10,),
                      Text(service.serviceDesc4,
                        style: TextStyle(fontSize: 15),
                        maxLines: 2,),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  TextButton(onPressed:(){},
                    child:Text('Know More',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lexend(
                        color: primaryClr,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 10,
              top: 0,
              child:
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(5)),
                  color: primaryClr,
                ),
                child:Text('Recomended',
                  style:TextStyle(fontSize: 15,
                      color: Colors.white
                  ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}