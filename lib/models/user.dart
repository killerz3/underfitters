import 'dart:io';

import 'package:country_picker/country_picker.dart';

class UserModel {
  //from form1
  String name = "";
  int age = 0;
  String gender = "";
  String? country;
  DateTime doa = DateTime(1900);
  String phoneCode = "";
  //from form2
  String phoneNo = "";
  String email = '';
  String address = "";
  String rol = '';
  //from form3
  File? picture;
  File? thumbPrint;
  File? fileID;

  UserModel(this.name, this.age, this.gender, this.country, this.doa,
      this.phoneCode, this.phoneNo, this.email, this.address, this.rol);
//methods

  UserModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        age = json['age'],
        gender = json['gender'],
        country = json['country'],
        doa = DateTime.parse(json['doa']),
        phoneCode = json['phoneCode'],
        phoneNo = json['phoneNo'],
        email = json['email'],
        address = json['address'],
        rol = json['rol'],
        picture = File(json['picture']),
        thumbPrint = File(json['thumbPrint']),
        fileID = File(json['fileID']);

    Map<String, dynamic> toJson() => {
        'name': name,
        'age': age,
        'gender':gender,
        'country':country,
        'doa':doa.toString(),
        'phoneCode':phoneCode,
        'phoneNo':phoneNo,
        'email':email,
        'address':address,
        'rol':rol,
        'picture':picture!.path,
        'thumbPrint':thumbPrint!.path,
        'fileID':fileID!.path,
      };
}
