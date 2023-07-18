class Service {
  String serviceTitle;
  String serviceDesc;
  String image;

  Service({
    required this.serviceTitle,
    required this.serviceDesc,
    required this.image,
  });

  Map<String, dynamic> toMap(){
    return {
      "serviceTitle":serviceTitle,
      "serviceDesc": serviceDesc,
      "image": image,
    };
  }

  factory Service.fromMap(Map<String,dynamic> map){
    return Service(
      serviceTitle: map['serviceTitle']??'',
      serviceDesc: map['serviceDesc']??'',
      image: map['image']??'',
    );
  }

}