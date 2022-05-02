import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:underfitters_app/models/user.dart';

class PageProvider extends ChangeNotifier {
  UserModel user =
      UserModel("", 0, "male", "", DateTime(2000), "", "", "", "", "");
}
