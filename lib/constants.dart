import 'package:flutter/material.dart';
import 'package:intern_proj_fl/home/screen/home_screen.dart';
import 'models/default_menu.dart';
import 'models/category.dart';
import 'models/coupon.dart';
import 'models/dish.dart';
import 'models/our_services.dart';
import 'models/service.dart';


const Color bluishClr=Color(0xFF4e5ae8);
const Color yellowClr=Color(0xFFFFB746);
const Color pinkClr=Color(0xFFff4667);
const Color white=Colors.white;
const primaryClr=Color(0xFF6318AF);
const Color darkGreyClr=Color(0xFF121212);
Color dartHeaderClr=Color(0xFF424242);

class Themes{
  static final light=ThemeData(
    backgroundColor: Colors.white,
    primaryColor: primaryClr,
    brightness: Brightness.light,
  );
  static final dark=ThemeData(
    backgroundColor: darkGreyClr,
    primaryColor: darkGreyClr,
    brightness: Brightness.dark,
  );
}

List pages = [
  HomeScreen(),
  HomeScreen(),
  HomeScreen(),
  HomeScreen(),
  HomeScreen(),
];

List<Category> categoryList=[
   Category(categoryName:'Starters', photo:'assets/category/starter.png'),
  Category(categoryName:'Drinks', photo:'assets/category/drink.png'),
  Category(categoryName:'Rice', photo:'assets/category/rice.png'),
  Category(categoryName:'Curry', photo:'assets/category/curry.png'),
  Category(categoryName:'Starters', photo:'assets/category/starter.png'),
  Category(categoryName:'Curry', photo:'assets/category/curry.png'),
  Category(categoryName:'Starters', photo:'assets/category/starter.png'),
];

List<Service> serviceList=[
  Service(serviceTitle: 'Customize Menu', serviceDesc: 'Select items for a single event or multiple events', image:'assets/services/customize_menu.svg'),
  Service(serviceTitle: 'Choose Services', serviceDesc: 'Select the type of services from varying cutlery, mode of serving options, & more', image:'assets/services/choose_service.svg'),
  Service(serviceTitle: 'Dynamic Pricing', serviceDesc: 'Price per plate varies with no. of items in a plate and no. of plates selected', image:'assets/services/dynamic_pricing.svg'),
  Service(serviceTitle: 'Track Your Order', serviceDesc: 'Track the order status and seek help from the executives anytime', image:'assets/services/track_order.svg'),
  Service(serviceTitle: 'Taste Your Samples', serviceDesc: 'Explode your taste bud with samples of what you order(on request for eligible orders)', image:'assets/services/taste_sample.svg'),
  Service(serviceTitle: 'Enjoy Food and Services', serviceDesc: 'Enjoy event with delicious and customized food ', image:'assets/services/enjoy_food.svg'),
];

List<Dish> startersList=[
  Dish(dishName:'Grill Chicken', photo:'assets/starters/chicken.png'),
  Dish(dishName:'Mushroom Fry', photo:'assets/starters/mashroom.png'),
  Dish(dishName:'Grill chicken', photo:'assets/starters/chicken.png'),
  Dish(dishName:'Mushroom Fry', photo:'assets/starters/mashroom.png'),
  Dish(dishName:'Grill Chicken', photo:'assets/starters/chicken.png'),
];

List<Dish> mainCourseList=[
  Dish(dishName:'Biryani', photo:'assets/maincourse/biryani.png'),
  Dish(dishName:'Bread', photo:'assets/maincourse/bread.png'),
  Dish(dishName:'Biryani', photo:'assets/maincourse/biryani.png'),
  Dish(dishName:'Bread', photo:'assets/maincourse/bread.png'),
  Dish(dishName:'Biryani', photo:'assets/maincourse/biryani.png'),
];

List<Coupon> couponList=[
  Coupon(couponCode:'FIRSTPLATE01', photo:'assets/images/coupne_pic.png', desc: 'Enjoy your first order, the taste of our delicious food!'),
  Coupon(couponCode:'FIRSTPLATE01', photo:'assets/images/coupne_pic.png', desc: 'Enjoy your first order, the taste of our delicious food!'),
  Coupon(couponCode:'FIRSTPLATE01', photo:'assets/images/coupne_pic.png', desc: 'Enjoy your first order, the taste of our delicious food!'),
  Coupon(couponCode:'FIRSTPLATE01', photo:'assets/images/coupne_pic.png', desc: 'Enjoy your first order, the taste of our delicious food!'),
];

List<DefaultMenuItems> defaultMenuList=[
  DefaultMenuItems(starter:3, mainCourse: 3, dessert: 3, drink: 3, min: 800, startsAt:777),
  DefaultMenuItems(starter:3, mainCourse: 3, dessert: 3, drink: 3, min: 800, startsAt:777),
  DefaultMenuItems(starter:3, mainCourse: 3, dessert: 3, drink: 3, min: 800, startsAt:777),
  DefaultMenuItems(starter:3, mainCourse: 3, dessert: 3, drink: 3, min: 800, startsAt:777),
];

List<OurService> ourServiceList=[
  OurService(serviceTitle: 'Signature', serviceDesc1: 'High Quality Disposable Cutlery', serviceDesc2: 'Elegant Decorations & Table Settings', serviceDesc3: 'Served by Waitstaff', serviceDesc4: 'Best for Weddings, Corporate Events etc', image: 'assets/images/signature_image.png', logo: 'assets/images/badge_s.png'),
  OurService(serviceTitle: 'Value', serviceDesc1: 'Disposable Cutlery', serviceDesc2:'Basic Decorations & Table Settings', serviceDesc3: 'Served in Buffet Style', serviceDesc4: 'Best for Birthdays, Family Gathering etc', image: 'assets/images/signature_image.png', logo: 'assets/images/badge_s.png'),
  OurService(serviceTitle: 'Signature', serviceDesc1: 'High Quality Disposable Cutlery', serviceDesc2: 'Elegant Decorations & Table Settings', serviceDesc3: 'Served by Waitstaff', serviceDesc4: 'Best for Weddings, Corporate Events etc', image: 'assets/images/signature_image.png', logo: 'assets/images/badge_s.png'),
];