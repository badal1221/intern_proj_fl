import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intern_proj_fl/components/custom_button_bg.dart';
import 'package:intern_proj_fl/home/screen/home_screen.dart';
import 'package:intern_proj_fl/models/user.dart';
import 'package:intern_proj_fl/provider/auth_provider.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../entry_point/screens/entry_point_screen.dart';


class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  TextEditingController _nameController=TextEditingController();
  TextEditingController _emailController=TextEditingController();

  @override
  void dispose(){
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading=Provider.of<AuthProvider>(context,listen: true).isLoading;
    return Scaffold(
        appBar:AppBar(
          leading:IconButton(
              onPressed:(){
                Navigator.pop(context);
              },
              icon:Icon(Icons.arrow_back_ios_new,color:Colors.black,)
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
        child: isLoading
            ?const Center(child: CircularProgressIndicator(color: primaryClr,),)
            :
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Just a step away !',
              textAlign: TextAlign.start,
              style:GoogleFonts.lexend(
                color: Color(0xFF030303),
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 25,),
            textField(controller:_nameController, hintText:'Full name*'),
            SizedBox(height: 15,),
            textField(controller:_emailController, hintText:'Email ID*'),
            Spacer(),
            CustomButton(text: "Let's Start",
              onTap:storeData,     //store data to firestore database
            ),
          ],
        ),
      )
    );
  }

  void storeData()async{
    final ap=Provider.of<AuthProvider>(context,listen: false);
    UserModel userModel=UserModel(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        createdAt: '',
        phoneNumber: '',
        uid: '', address: '');
    ap.saveUserDataToFirebase(context:context,
       userModel: userModel,
      onSuccess:(){//got all data and updated the firestore too//updated local sp//changed isSignin
        ap.saveUserDataToSP().then((value)=>
            ap.setSignIn().then((value) =>
                Navigator.push(context,
                    MaterialPageRoute(builder:
                        (context)=>EntryPointScreen(),
                    )
                ),
            ),
        );
      });
  }

  Widget textField({
    required TextEditingController controller,
    required String hintText,
  }){
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius:BorderRadius.circular(10),
      ),
      child: TextFormField(
        autofocus: false,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border:InputBorder.none,
          enabledBorder:UnderlineInputBorder(
              borderRadius:BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 0,
              )
          ),
          focusedBorder:UnderlineInputBorder(
              borderRadius:BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 0,
              )
          ),
        ),
      ),
    );
  }

}

