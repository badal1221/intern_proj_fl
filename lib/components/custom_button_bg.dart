import 'package:flutter/material.dart';

import '../constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;
  const CustomButton({Key? key, required this.text, required this.onTap,this.color=primaryClr}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child:Text(text,style: TextStyle(
          color: Colors.white,
        fontSize: 15
      ),),
      style:ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity,50),
        primary: color,
      ) ,);
  }
}

