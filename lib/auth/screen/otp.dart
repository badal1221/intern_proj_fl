import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intern_proj_fl/auth/screen/info.dart';
import 'package:intern_proj_fl/constants.dart';
import 'package:intern_proj_fl/home/screen/home_screen.dart';
import 'package:intern_proj_fl/provider/auth_provider.dart';
import 'package:intern_proj_fl/util/utils.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../../entry_point/screens/entry_point_screen.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  const OtpScreen({Key? key, required this.verificationId,}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  String? otpCode;
  @override
  Widget build(BuildContext context) {

    final isLoading=Provider.of<AuthProvider>(context,listen: true).isLoading;
    final ap=Provider.of<AuthProvider>(context,listen:false);
    return Scaffold(
      backgroundColor:Color.fromARGB(255, 247, 246, 240),
      appBar:AppBar(
        leading:IconButton(
          onPressed:(){
            Navigator.pop(context);
          },
          icon:Icon(Icons.arrow_back_ios_new,color:Colors.black,)
        ),
        title:Text('OTP Verification',
          style:GoogleFonts.lexend(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          )),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body:SingleChildScrollView(
        child: isLoading
            ?const Center(child: CircularProgressIndicator(color: primaryClr,),)
            :Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 70,),
                Text(
                  'We have sent a verification code to',
                  textAlign: TextAlign.center,
                  style:GoogleFonts.lexend(
                    color: Color(0xFF545454),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.50,
                  )
                ),
                const SizedBox(height: 35,),
                Text(
                  "+91-xxxxxx7689",
                  textAlign: TextAlign.center,
                  style:GoogleFonts.lexend(
                    color: Color(0xFF010F07),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 40,),
                Pinput(
                  length: 6,
                  defaultPinTheme: PinTheme(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.purple.shade200
                      )
                    ),
                    textStyle:const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  onCompleted:(value){
                      setState(() {
                        otpCode=value;
                      });
                  },
                ),
                const SizedBox(height: 40,),
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed:(){
                      if(otpCode !=null){
                          verifyOtp(context,otpCode!);
                      }
                      else{
                        showSnackBar(context, 'Enter 6-Digit code');
                      }
                    },
                    child:Text('Submit',style: TextStyle(fontSize: 20),),
                    style:ElevatedButton.styleFrom(
                        primary:const Color(0xFF6318AF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                    ),),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Didn’t receive code?',
                      style:GoogleFonts.lexend(
                        color: Color(0xFF010F07),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.50,
                      ),
                    ),
                    TextButton(
                        onPressed:(){},
                        child:Text(
                          'Resend Again.',
                          style:GoogleFonts.lexend(
                            color: Color(0xFF6318AF),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.50,
                          ),
                        ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //verify otp

  void verifyOtp(BuildContext context,String userOtp){
     final ap=Provider.of<AuthProvider>(context,listen: false);
     ap.verifyOtp(
         context: context,
         verificationId: widget.verificationId,
         userOtp: userOtp,
         onSuccess:(){
           //check if user already exists in db or a new user
           ap.checkExistingUser().then((value) async{
             if(value==true){//old user direct to homescreen
                ap.getDataFromFirestore().then((value) =>
                    ap.saveUserDataToSP().then((value) =>
                        ap.setSignIn().then((value) =>
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=>
                                    EntryPointScreen(),
                                ),
                            ),
                        ),
                    ),
                );
             }else{//new user we need to ask name and email
               Navigator.push(context,MaterialPageRoute(builder: (context)=>InfoScreen()));
             }
           });
         });
  }

}
