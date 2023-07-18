import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
   String name;
   String email;
   String createdAt;
   String phoneNumber;
   String uid;
   String address;

  UserModel({
        required this.name,
        required this.email,
        required this.createdAt,
        required this.phoneNumber,
        required this.uid,
        required this.address
      });

  Map<String, dynamic> toMap(){
    return {
      "name": name,
      "email": email,
      "createdAt": createdAt,
      "profilePhoto":phoneNumber,
      "uid": uid,
      "address":address,
    };
  }

  factory UserModel.fromMap(Map<String,dynamic> map){
    return UserModel(
            name: map['name']??'',
            email: map['email']??'',
            createdAt: map['createdAt']??'',
            phoneNumber: map['phoneNumber']??'',
            uid: map['uid']??'',
            address: map['address']??'',
          );
  }

}