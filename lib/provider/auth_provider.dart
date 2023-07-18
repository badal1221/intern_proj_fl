import 'dart:convert';
//import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intern_proj_fl/auth/screen/auth_screen.dart';
import 'package:intern_proj_fl/auth/screen/otp.dart';
import 'package:intern_proj_fl/home/screen/home_screen.dart';
import 'package:intern_proj_fl/models/user.dart';
import 'package:intern_proj_fl/util/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier{
   bool _isSignedIn=false;
   bool get isSignedIn=>_isSignedIn;

   bool _isLoading=false;
   bool get isLoading=>_isLoading;

   String? _uid;
   String get uid=>_uid!;

   UserModel? _userModel;
   UserModel get userModel=>_userModel!;

   final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
   final FirebaseFirestore _firestore=FirebaseFirestore.instance;


   AuthProvider(){
     checkSign();
   }

   void checkSign()async{
     final SharedPreferences s=await SharedPreferences.getInstance();
     _isSignedIn=s.getBool('is_signed')??false;//checking (set false if nothing found=>no userdata locally)
     notifyListeners();
   }

   Future setSignIn() async{
     final SharedPreferences s=await SharedPreferences.getInstance();
     s.setBool('is_signed',true);
     _isSignedIn=true;
     notifyListeners();
   }


   void signInWithPhone(BuildContext context,String phoneNumber)async{
     try{
       await _firebaseAuth.verifyPhoneNumber(
           phoneNumber: phoneNumber,
           verificationCompleted: (PhoneAuthCredential phoneAuthCredential)async{
             await _firebaseAuth.signInWithCredential(phoneAuthCredential);
           },
           verificationFailed:(error){
             throw Exception(error.message);
           },
           codeSent:(verificationId,forceResendingToken){
             Navigator.push(context,MaterialPageRoute(
                 builder: (context)=>OtpScreen(verificationId: verificationId)));
           },
           codeAutoRetrievalTimeout:(verificationId){});
     }on FirebaseAuthException catch(e){
         showSnackBar(context,e.message.toString());
     }
   }



   void verifyOtp({
     required BuildContext context,
     required String verificationId,
     required String userOtp,
     required Function onSuccess
  })async{
    _isLoading=true;
    notifyListeners();
    try{
        PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId:verificationId, smsCode: userOtp);
        User user=(await _firebaseAuth.signInWithCredential(credential)).user!;
        if(user!=null){//verification success
          _uid=user.uid;
          onSuccess();
        }
        _isLoading=false;
        notifyListeners();
    }on FirebaseAuthException catch(e){
      showSnackBar(context,e.message.toString());
      _isLoading=false;
      notifyListeners();
    }
 }


 //db operations
  Future<bool> checkExistingUser()async{
     DocumentSnapshot snapshot=await _firestore.collection('users').doc(_uid).get();
     if(snapshot.exists)
        return true;//user already exist
     return false;//new user
  }

  //store data to db(name,email)
  void saveUserDataToFirebase({
     required BuildContext context,
    required UserModel userModel,
    required Function onSuccess
   })async{
    _isLoading=true;
    notifyListeners();
    try{
      userModel.createdAt=DateTime.now().millisecondsSinceEpoch.toString();
      userModel.phoneNumber=_firebaseAuth.currentUser!.phoneNumber!;
      userModel.uid=_firebaseAuth.currentUser!.uid;
      _userModel=userModel;
      await _firestore.collection('users').doc(_uid).set(userModel.toMap()).then((value){
        onSuccess();
        _isLoading=false;
        notifyListeners();
      });//uploading users data to firestore

    }on FirebaseAuthException catch(e){
      showSnackBar(context,e.message.toString());
      _isLoading=false;
      notifyListeners();
    }
  }

   //storing data locally
   Future saveUserDataToSP()async{
     SharedPreferences s=await SharedPreferences.getInstance();
     await s.setString('user_model',jsonEncode(userModel.toMap()));
   }

   Future getDataFromFirestore()async{
     await _firestore.collection('users').doc(_firebaseAuth.currentUser!.uid).get().then((DocumentSnapshot snapshot){
       _userModel=UserModel(
         name: snapshot['name'],
         email: snapshot['email'],
         createdAt: snapshot['createdAt'],
         phoneNumber: snapshot['phoneNumber'],
         uid:snapshot['uid'],
         address:snapshot['address']??'',
       );
       _uid=_userModel!.uid;
       notifyListeners();
     });
   }

   Future getDataFromSP()async{
     SharedPreferences s=await SharedPreferences.getInstance();
     String data=s.getString('user_model')??'';
     _userModel=UserModel.fromMap(jsonDecode(data));
     _uid=_userModel!.uid;
     notifyListeners();
   }

   Future userSignOut()async{
     await _firebaseAuth.signOut();
     _isSignedIn=false;
     notifyListeners();
     SharedPreferences s=await SharedPreferences.getInstance();
     s.clear();
   }

}

