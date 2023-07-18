import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intern_proj_fl/auth/screen/auth_screen.dart';
import 'package:intern_proj_fl/entry_point/screens/entry_point_screen.dart';
import 'package:provider/provider.dart';

import '../home/screen/home_screen.dart';
import '../provider/auth_provider.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int current_page=0;
  List<Map<String,String>> spldata=[
    {
      'headline':'Create Your Own Plate',
      'text':'Create unforgettable memories with our unique feature to curate your favorite cuisines and food, tailored to your special occasion.',
      'image':"assets/images/entry_1.svg",
    },
    {
      'headline':'Exquisite Catering',
      'text':'Experience culinary artistry like never before with our innovative and exquisite cuisine creations.',
      'image':"assets/images/entry_2.svg",
    },
    {
      'headline':'Personal Order Executive',
      'text':'Embark on a personalized culinary journey with our dedicated one-to-one customer support, ensuring a seamless and satisfying experience every step of the way.',
      'image':"assets/images/entry_3.svg",
    }
  ];

  navigateToAuthScreen(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>AuthScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final ap=Provider.of<AuthProvider>(context,listen:false);
    return Column(
      children:[
        SizedBox(
          height: 100,
          child: Row(
            children: [
              Expanded(child: const SizedBox()),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 20),
                child: InkWell(
                  onTap:()async{
                    if(ap.isSignedIn){
                      await ap.getDataFromSP().whenComplete(()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>EntryPointScreen())));
                    }
                    else{
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                    }
                  },
                  child:Container(
                    alignment: Alignment.center,
                    width: 45,
                    height: 20,
                    decoration:const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5),),
                      color: Color(0xFFC7A9ED),
                    ),
                    child:Text(
                      'Skip',
                      style: GoogleFonts.lexend(
                        color: Color(0xFF6318AF),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30,),
        Expanded(
          flex: 6,
          child: PageView.builder(
            onPageChanged:(value){
              setState(() {
                current_page=value;
              });
            },
            itemCount:spldata.length,
            itemBuilder:(context,index)=>ExpandedContent(
              headline: spldata[index]['headline'],
              text:spldata[index]['text'],
              image: spldata[index]['image'],
            ),),
        ),
        Expanded(flex: 2,
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:List.generate(spldata.length,
                          (index) => buildDot(index:index)),
                ),
                const SizedBox(height: 20,),
                current_page!=2?InkWell(
                  onTap: () {},
                  child: Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF6318AF),
                      border: Border.all(color:Color(0xFFE0D4EC) ,width:8),
                    ),
                    child:Icon(Icons.arrow_forward),
                  ),
                ):
                Container(
                  width: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                      color:Color(0xFFE0D4EC)
                  ),
                  child:Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Get Started',
                          style:GoogleFonts.lexend(
                            color: Color(0xFF6318AF),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          )
                        ),
                      ),
                      InkWell(
                        onTap:()async{
                          if(ap.isSignedIn){
                            await ap.getDataFromSP().whenComplete(()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>EntryPointScreen())));
                          }
                          else{
                                Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthScreen()));
                          }
                        },
                        child: Container(
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFF6318AF),
                            border: Border.all(color:const Color(0xFFE0D4EC) ,width:6),
                          ),
                          child:const Icon(Icons.arrow_forward),
                        ),
                      ),
                    ],
                  ) ,
                ),
              ],
            ),
        ),
      ],
    );
  }
  Container buildDot({required int index}){
    return Container(
       margin: EdgeInsets.only(right: 7),
        height: 10,
        width: 26,
        decoration: ShapeDecoration(
          color:current_page==index?Color(0xFF6318AF):Color(0xFFB697DE),
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 0.50, color:current_page==index?Color(0xFF6318AF):Color(0xFFB697DE),),
            borderRadius: BorderRadius.circular(4.50),
          ),
        ),
    );
  }

}

class ExpandedContent extends StatelessWidget {
  const ExpandedContent({Key? key,this.headline, this.text, this.image}) : super(key: key);
  final String? headline,text,image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width:double.infinity,
        height:double.infinity,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height:250,
                child: SvgPicture.asset(
                  image!,
                ),
              ),
              const SizedBox(height: 30,),
              Text(
                headline!,
                style:GoogleFonts.lexend(
                  color: Color(0xFF030303),
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  text!,
                  maxLines: 5,
                  style: GoogleFonts.lexend(
                    color: Color(0xFF7B7B7B),
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}






