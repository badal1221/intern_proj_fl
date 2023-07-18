
class Category {
  String categoryName;
  String photo;

  Category({
    required this.categoryName,
    required this.photo,
  });

  Map<String, dynamic> toMap(){
    return {
      "categoryName":categoryName,
      "photo": photo,
    };
  }

  factory Category.fromMap(Map<String,dynamic> map){
    return Category(
      categoryName: map['categoryName']??'',
      photo: map['photo']??'',
    );
  }

}