import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intern_proj_fl/constants.dart';
import 'package:intern_proj_fl/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  //static String verify="";

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController _phnoController=TextEditingController();
  var phone='';
  @override
  void dispose() {
    super.dispose();
    _phnoController.dispose();
  }

  Country selectedCountry=Country(phoneCode:'91',
      countryCode: 'IN',
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: 'India',
      example: 'India',
      displayName:'India',
      displayNameNoCountryCode: 'IN',
      e164Key: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset('assets/images/Vector_54.png',),
                  Positioned(
                      top: 60,
                      child:Column(
                        children: [
                          SvgPicture.asset(
                            "assets/images/Logo.svg",
                            height:80,
                            width:80,
                          ),
                          const SizedBox(height: 10,),
                          SizedBox(
                            height: 62,
                            width: 120,
                            child: Text(
                              'CraftMyPlate',
                              style:GoogleFonts.lexend(
                                color: const Color(0xFFFCFFF7),
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                  ),
                ],
              ),
              const SizedBox(height: 35,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Text(
                        'Login or Signup',
                        textAlign:TextAlign.left,
                        style:GoogleFonts.lexend(
                          color: Color(0xFF787878),
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                    ),
                    const SizedBox(height: 35,),
                    TextFormField(
                      controller: _phnoController,
                      cursorColor: primaryClr,
                      keyboardType: TextInputType.number,
                      decoration:InputDecoration(
                        hintText: 'Enter Phone Number',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.black12),
                        ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.black12),
                          ),
                        prefixIcon: Container(
                          alignment: Alignment.centerLeft,
                          width: 80,
                          padding: const EdgeInsets.all(8.0),
                          child:InkWell(
                            onTap:(){
                              showCountryPicker(context: context,
                                  countryListTheme:const CountryListThemeData(
                                    bottomSheetHeight: 500
                                  ),
                                  onSelect: (value){
                                     setState(() {
                                        selectedCountry=value;
                                     });
                                  });
                            },
                            child: Text('${selectedCountry.flagEmoji}+${selectedCountry.phoneCode}',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                              ),),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 35,),
                    SizedBox(
                      height: 45,
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed:sendPhoneNumber,
                          child:Text('Continue',style: TextStyle(fontSize: 20),),
                          style:ElevatedButton.styleFrom(
                            primary:const Color(0xFF6318AF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )
                          ),),
                    ),
                    const SizedBox(height: 250,),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'By continuing, you agree to our\n',
                            style:GoogleFonts.lexend(
                              color: Color(0xFF7B7B7B),
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          TextSpan(
                            text: 'Terms of Service',
                            style: GoogleFonts.lexend(
                              color: Color(0xFF7B7B7B),
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              decoration: TextDecoration.underline
                            ),
                          ),
                          TextSpan(
                            text: ' ',
                            style: GoogleFonts.lexend(
                              color: Color(0xFF7B7B7B),
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: GoogleFonts.lexend(
                              color: Color(0xFF7B7B7B),
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                                decoration: TextDecoration.underline
                            )
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void sendPhoneNumber(){
    final ap=Provider.of<AuthProvider>(context,listen: false);
    String phoneNumber=_phnoController.text.trim();
    ap.signInWithPhone(context, '+${selectedCountry.phoneCode}$phoneNumber');
  }
}
