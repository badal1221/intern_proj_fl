class Coupon {
  String couponCode;
  String photo;
  String desc;

  Coupon({
    required this.couponCode,
    required this.photo,
    required this.desc,
  });

  Map<String, dynamic> toMap(){
    return {
      "couponCode":couponCode,
      "photo": photo,
      "desc": desc,
    };
  }

  factory Coupon.fromMap(Map<String,dynamic> map){
    return Coupon(
      couponCode: map['couponCode']??'',
      photo: map['photo']??'',
      desc: map['desc']??'',
    );
  }
}