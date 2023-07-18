class Dish {
  String dishName;
  String photo;

  Dish({
    required this.dishName,
    required this.photo,
  });

  Map<String, dynamic> toMap(){
    return {
      "dishName":dishName,
      "photo": photo,
    };
  }

  factory Dish.fromMap(Map<String,dynamic> map){
    return Dish(
      dishName: map['dishName']??'',
      photo: map['photo']??'',
    );
  }
}