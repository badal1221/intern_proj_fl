import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants.dart';

class EntryPointScreen extends StatefulWidget {
  const EntryPointScreen({Key? key}) : super(key: key);

  @override
  State<EntryPointScreen> createState() => _EntryPointScreenState();
}

class _EntryPointScreenState extends State<EntryPointScreen> {
  int pageIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: SvgPicture.asset('assets/icons/middle_logo.svg',),
        onPressed: () {
          setState(() {
            pageIndex=2;
          });
        },),
      bottomNavigationBar: BottomAppBar(
        // shape: CircularNotchedRectangle(),
        // notchMargin: 4.0,
        child:Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                height: 55,
                child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: IconButton(
                          color:pageIndex==0?primaryClr:Colors.black,
                          icon:Icon(Icons.home_outlined,),
                          onPressed: () {
                            setState(() {
                              pageIndex=0;
                            });
                          },
                        ),
                      ),
                      Text('Home',style: TextStyle(fontSize: 13),),
                    ],
                ),
              ),
              SizedBox(
                height: 55,
                child: Column(
                    children: [
                      SizedBox(
                       height: 40,
                       width: 40,
                        child: IconButton(
                          icon:SvgPicture.asset('assets/icons/logo_2.svg',color:pageIndex==1?primaryClr:Colors.black,),
                          onPressed: () {
                            setState(() {
                              pageIndex=1;
                            });
                          },
                        ),
                      ),
                      Text('Wishlist',style: TextStyle(fontSize: 13),),
                    ],
                ),
              ),
              SizedBox(width: 20,),
              SizedBox(
                height: 55,
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                      width: 40,
                      child: IconButton(
                        icon:SvgPicture.asset('assets/icons/logo_4.svg',color:pageIndex==3?primaryClr:Colors.black,),
                        onPressed: () {
                          setState(() {
                            pageIndex=3;
                          });
                        },
                      ),
                    ),
                    Text('Orders',style: TextStyle(fontSize: 13),),
                  ],
                ),
              ),
              SizedBox(
                height: 55,
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                      width: 40,
                      child: IconButton(
                        icon:SvgPicture.asset('assets/icons/logo_5.svg',color:pageIndex==4?primaryClr:Colors.black,),
                        onPressed: () {
                          setState(() {
                            pageIndex=4;
                          });
                        },
                      ),
                    ),
                    Text('Profile',style: TextStyle(fontSize: 13),),
                  ],
                ),
              ),
            ],
        ),
      ),
      body: pages[pageIndex],
    );
  }
}
