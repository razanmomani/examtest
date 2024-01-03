class ConfigModel {
  String? email;
  String? fullName;
  String? mobile;
  String? gender;
  String? userId;
  String? imgUrl;

  ConfigModel({this.imgUrl, this.userId, this.email, this.fullName, this.mobile, this.gender});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> result = {
      'email': email,
      'mobile': mobile,
      'fullName': fullName,
      'gender': gender,
      'imgUrl': imgUrl,
      'userId': userId,
    };
    return result;
  }
  factory ConfigModel.fromMap(Map<String, dynamic> map) {
    return ConfigModel(
      email: map['email']as String ?,
      mobile: map['mobile'] as String?,
      fullName: map['fullName']as String ?,
      gender: map['gender']as String ?,
      imgUrl: map['imgUrl'] as String?,
      userId: map['userId']as String ?,
    );
  }
}
