import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:underfitters_app/form%20pages/page_provider.dart';
import 'package:underfitters_app/home.dart';
import 'package:underfitters_app/login.dart';
import 'package:underfitters_app/models/user.dart';
import 'package:underfitters_app/profile.dart';

void main() {
  runApp(ChangeNotifierProvider<PageProvider>(
      create: (_) => PageProvider(), child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  UserModel? user;

  Future getUser() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? jsonString = pref.getString('user');
    print('this is ');

    print(jsonString);
    if (jsonString == null) {
      setState(() => user = null);
    } else {
      setState(() => user = UserModel.fromJson(jsonDecode(jsonString)));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: user == null ? Login() : Profile(),
      theme: ThemeData(
        primaryColor: HexColor("#5CB57F"),
        splashColor: HexColor("#80d3c4"),
        appBarTheme: AppBarTheme(backgroundColor: HexColor("#5CB57F")),
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ).copyWith(
            labelMedium: TextStyle(fontSize: 32),
            button:
                TextStyle(fontSize: 32, color: Color.fromARGB(255, 0, 0, 0))),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(HexColor("#80d3c4")),
                foregroundColor:
                    MaterialStateProperty.all(Color.fromARGB(255, 47, 47, 47)),
                elevation: MaterialStateProperty.all(0),
                padding: MaterialStateProperty.all(EdgeInsets.all(8)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))))),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 1),
              borderRadius: BorderRadius.circular(15)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: HexColor("#80d3c4"), width: 2),
              borderRadius: BorderRadius.circular(15)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: HexColor("#5CB57F"), width: 3),
              borderRadius: BorderRadius.circular(15)),
          errorBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.redAccent.shade700, width: 3),
              borderRadius: BorderRadius.circular(15)),
          labelStyle:
              TextStyle(fontSize: 25, color: Color.fromARGB(255, 45, 45, 45)),
          hintStyle:
              TextStyle(fontSize: 25, color: Color.fromARGB(193, 45, 45, 45)),
        ),
      ),
    );
  }
}
