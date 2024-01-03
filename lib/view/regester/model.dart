import 'dart:io';

class UserModel {
  String email;
  String? password;
  String? confirmPassword;
  String mobile;
  String fullName;
  String gender;
  String imgUrl;
  String? uid;
  File? file;
  UserModel(
      {required this.email,
      this.password,
      this.confirmPassword,
      required this.mobile,
      required this.fullName,
      required this.gender,
      required this.imgUrl,
      this.uid,
      this.file});


//firebase regester firestore
  Map<String, dynamic> toMap() {
    Map<String, dynamic> result = {
      'email': email,
      'mobile': mobile,
      'uid': uid,
      'imgUrl': imgUrl,
      'fullName': fullName,
      'gender': gender,
    };
    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'],
      mobile: map['mobile'],
      fullName: map['fullName'],
      gender: map['gender'],
      imgUrl: map['imgUrl'],
    );
  }
}
