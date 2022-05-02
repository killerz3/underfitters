import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:underfitters_app/form%20pages/page_provider.dart';
import 'package:underfitters_app/models/user.dart';
import 'package:underfitters_app/profile.dart';

class Form3 extends StatefulWidget {
  const Form3({Key? key}) : super(key: key);

  @override
  State<Form3> createState() => _Form3State();
}

class _Form3State extends State<Form3> {
  File? picture;
  File? thumbPrint;
  File? fileID;

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    setState(() => picture = File(image.path));
  }

  Future pickThumb() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    setState(() => thumbPrint = File(image.path));
  }

  Future pickID() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    setState(() => fileID = File(image.path));
  }

  @override
  Widget build(BuildContext context) {
    UserModel user = Provider.of<PageProvider>(context).user;

    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height,
          child: Form(
              child: SingleChildScrollView(
            child: Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        pickImage();
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.photo,
                            size: 38,
                          ),
                          SizedBox(width: 20),
                          Text("Select Picture"),
                        ],
                      )),
                  SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        pickThumb();
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.fingerprint,
                            size: 38,
                          ),
                          SizedBox(width: 20),
                          Text("Select Thumb Print"),
                        ],
                      )),
                  SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        pickID();
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.perm_identity,
                            size: 38,
                          ),
                          SizedBox(width: 20),
                          Text("Select Identification"),
                        ],
                      )),
                  SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () async {
                      user.picture = picture;
                      user.thumbPrint = thumbPrint;
                      user.fileID = fileID;
                      final SharedPreferences pref =
                          await SharedPreferences.getInstance();
                      pref.setString('user', jsonEncode(user.toJson()));
                      print(pref.getString('user'));
                      
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Profile();
                      }));
                    },
                    child: Text("Submit"),
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                        padding: MaterialStateProperty.all(EdgeInsets.all(15))),
                  ),
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }
}
