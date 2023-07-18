import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intern_proj_fl/constants.dart';
import 'package:provider/provider.dart';
import '../../provider/auth_provider.dart';
import '../widget/coupon_card.dart';
import '../widget/default_menu_card.dart';
import '../widget/main_course_card.dart';
import '../widget/our_service_card.dart';
import '../widget/service_card.dart';
import '../widget/top_category_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController=TextEditingController();

    final ap=Provider.of<AuthProvider>(context,listen:false);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:AppBar(
        backgroundColor:Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title:Text('Hi, ${ap.userModel.name}!',
          style: GoogleFonts.lexend(
            color: primaryClr,
            fontSize: 22,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Current location',
                style:GoogleFonts.lexend(
                  color: Color(0xFF7B7B7B),
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.location_on_outlined,size: 20,),
                  Expanded(child:Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text('${ap.userModel.address}',
                      style: const TextStyle(
                        fontWeight:FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  ),
                  Padding(padding:EdgeInsets.only(left: 5,top: 2),
                    child: Column(
                      children: [
                        Icon(Icons.play_circle_outline,size: 18,color: primaryClr,),
                        Text('How it works?',
                          style:GoogleFonts.lexend(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.w300,
                          ),
                        )
                      ],
                    )
                  ),
                ],
              ),
              const SizedBox(height: 15,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...couponList.map((coupon) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal:7 ).copyWith(bottom: 15),
                      child: CouponCard(coupon:coupon,),
                    )),
                  ],
                ),
              ),
              const SizedBox(height: 15,),
              SearchBar(controller: _searchController),
              const SizedBox(height: 40,),


              Text(
                'Start crafting',
                style:GoogleFonts.lexend(
                  color: primaryClr,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...defaultMenuList.map((menu) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal:5 ).copyWith(bottom: 30),
                      child:DefaultMenuCard(menu:menu,),
                    )),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                    height: 130,
                    child: Material(
                      elevation: 4,
                      borderRadius: BorderRadius.circular(20),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                            child:Image.asset('assets/images/default_platter.png',)
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Default Platters',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lexend(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 15,),
                  Container(
                    height: 130,
                    child: Material(
                      elevation: 4,
                      borderRadius: BorderRadius.circular(20),
                      child: Column(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                              child:Image.asset('assets/images/craft_your_own.png',)
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Craft your own',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lexend(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Text(
                'Top Categories',
                style:GoogleFonts.lexend(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...categoryList.map((category) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal:20 ).copyWith(bottom: 20),
                      child: TopCategoryCard(category:category,),
                    )),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Starters',
                    style:GoogleFonts.lexend(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'More Starters',
                    style:GoogleFonts.lexend(
                      color: primaryClr,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...startersList.map((dish) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal:7 ).copyWith(bottom: 30),
                      child:MainCourseCard(dish:dish),
                    )),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Main Course',
                    style:GoogleFonts.lexend(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'More Main Course',
                    style:GoogleFonts.lexend(
                      color: primaryClr,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...mainCourseList.map((dish) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal:7 ).copyWith(bottom: 30),
                      child:MainCourseCard(dish:dish),
                    )),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Text(
                'Services',
                style:GoogleFonts.lexend(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10,),


              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...ourServiceList.map((service) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal:5 ).copyWith(bottom: 30),
                      child:OurServiceCard(service: service,),
                    )),
                  ],
                ),
              ),

              const SizedBox(height: 10,),
              Text(
                'How does it work ?',
                style: GoogleFonts.lexend(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10,),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount:serviceList.length,
                    itemBuilder: (context,index){
                      return ServiceCard(service: serviceList[index],index: index,);
                    }),
              ),
              const SizedBox(height: 10,),
              SizedBox(
                width: 255,
                child: Text(
                  'Delicious food with professional service !',
                  style:GoogleFonts.lexend(
                    color: Color(0xFF242424),
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  )
                ),
              ),
              const SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }

  //search bar
  Widget SearchBar({required TextEditingController controller,}){
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 42,
            child: Material(
              borderRadius: BorderRadius.circular(7),
              elevation: 4,
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    borderSide:
                    BorderSide(color: Colors.black, width: 1),
                  ),
                  hintText: 'Search food or events',
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                  suffixIcon: InkWell(
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.only(left: 6),
                      child: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 23,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
















