class DefaultMenuItems{
  int starter;
  int mainCourse;
  int dessert;
  int drink;
  int min;
  int startsAt;

  DefaultMenuItems({
    required this.starter,
    required this.mainCourse,
    required this.dessert,
    required this.drink,
    required this.min,
    required this.startsAt,
  });

  Map<String, dynamic> toMap(){
    return {
      "starter":starter,
      "mainCourse": mainCourse,
      "dessert": dessert,
      "drink": drink,
      "min": min,
      "photo": startsAt,
    };
  }

  factory DefaultMenuItems.fromMap(Map<String,dynamic> map){
    return DefaultMenuItems(
      starter: map['starter']??0,
      mainCourse: map['mainCourse']??0,
      dessert: map['dessert']??0,
      drink: map['drink']??0,
      min: map['min']??0,
      startsAt: map['startsAt']??0,
    );
  }
}