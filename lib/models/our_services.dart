class OurService {
  String serviceTitle;
  String serviceDesc1;
  String serviceDesc2;
  String serviceDesc3;
  String serviceDesc4;
  String image;
  String logo;

  OurService({
    required this.serviceTitle,
    required this.serviceDesc1,
    required this.serviceDesc2,
    required this.serviceDesc3,
    required this.serviceDesc4,
    required this.image,
    required this.logo,
  });

  Map<String, dynamic> toMap(){
    return {
      "serviceTitle":serviceTitle,
      "serviceDesc1": serviceDesc1,
      "serviceDesc2": serviceDesc2,
      "serviceDesc3": serviceDesc3,
      "serviceDesc4": serviceDesc4,
      "image": image,
      "logo":logo,
    };
  }

  factory OurService.fromMap(Map<String,dynamic> map){
    return OurService(
      serviceTitle: map['serviceTitle']??'',
      serviceDesc1: map['serviceDesc1']??'',
      serviceDesc2: map['serviceDesc2']??'',
      serviceDesc3: map['serviceDesc3']??'',
      serviceDesc4: map['serviceDesc4']??'',
      image: map['image']??'',
      logo:map['logo']??'',
    );
  }

}