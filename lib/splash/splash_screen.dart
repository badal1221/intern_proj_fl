import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intern_proj_fl/provider/auth_provider.dart';
import 'package:intern_proj_fl/splash/entry_screens.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isStartAnim=false;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2),(){
      setState(() {
        isStartAnim=true;
        Future.delayed(Duration(seconds: 3),(){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>EntryScreens()));
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {



    final size=MediaQuery.of(context).size;
    return Scaffold(
      body: AnimatedContainer(
        duration:const Duration(seconds: 2),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color:isStartAnim?const Color.fromARGB(255, 99, 24, 175):const Color.fromARGB(255, 247, 229, 183),
        ),
        child:Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/bg_1.svg",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Positioned(
              top: 200,
              child:Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    AnimatedContainer(
                      duration: Duration(seconds: 2),
                      height:isStartAnim?140:100,
                      width:isStartAnim?140:100,
                      curve: Curves.easeInOut,
                      child: SvgPicture.asset(
                        "assets/images/Logo.svg",
                        height:isStartAnim?140:100,
                        width:isStartAnim?140:100,
                      ),
                    ),
                    const SizedBox(height: 20,),
                    AnimatedContainer(
                      duration: Duration(seconds: 1),
                      curve: Curves.easeIn,
                      height: isStartAnim?0:30,
                      child: Text('Welcome',
                        style: GoogleFonts.capriola(
                          color: Color(0xFFF7E5B7),
                          fontSize: 32,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      opacity:isStartAnim?1:0,
                      duration:const Duration(seconds: 2),
                      curve: Curves.easeIn,
                      child:Column(
                        children:[
                          Text(
                            'Craft My Plate',
                            style: GoogleFonts.capriola(
                              color: Color(0xFFF7E5B7),
                              fontSize: 32,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            'You customise, We cater',
                            style: GoogleFonts.courgette(
                              color: Color(0xFFD5B67D),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
