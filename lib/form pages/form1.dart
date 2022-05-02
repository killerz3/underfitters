// ignore_for_file: prefer_const_constructors

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:underfitters_app/form%20pages/page_provider.dart';
import 'package:underfitters_app/models/user.dart';

class Form1 extends StatefulWidget {
  const Form1({Key? key}) : super(key: key);

  @override
  State<Form1> createState() => _Form1State();
}

class _Form1State extends State<Form1> {
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String name = "";
  String gender = "male";
  int age = 0;
  String country = "";
  DateTime doa = DateTime(2022);
  @override
  Widget build(BuildContext context) {
    UserModel user = Provider.of<PageProvider>(context, listen: false).user;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    children: [
                      Text("Register Here",style: TextStyle(fontSize: 48),),
                      SizedBox(height: 50),
                      TextField(
                        onChanged: ((value) => setState(() {
                              user.name = value;
                              // print(value);
                            })),
                        style: TextStyle(fontSize: 32),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            label: Text("Name"),
                            hintText: "Please add your name"),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        onChanged: ((value) =>
                            setState(() => user.age = int.parse(value))),
                        style: TextStyle(fontSize: 32),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text("Age"),
                          hintText: "Enter your age",
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () => setState(() {
                              user.gender = "male";
                            }),
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Provider.of<PageProvider>(context)
                                            .user
                                            .gender ==
                                        "male"
                                    ? Theme.of(context).primaryColor
                                    : Theme.of(context).splashColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.male,
                                    size: 50,
                                  ),
                                  Text(
                                    "Male",
                                    style: TextStyle(fontSize: 24),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => setState(() => user.gender = "female"),
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Provider.of<PageProvider>(context)
                                            .user
                                            .gender ==
                                        "female"
                                    ? Theme.of(context).primaryColor
                                    : Theme.of(context).splashColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.female,
                                    size: 50,
                                  ),
                                  Text(
                                    "Female",
                                    style: TextStyle(fontSize: 24),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => setState(() => user.gender = "others"),
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Provider.of<PageProvider>(context)
                                            .user
                                            .gender ==
                                        "others"
                                    ? Theme.of(context).primaryColor
                                    : Theme.of(context).splashColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.transgender,
                                    size: 50,
                                  ),
                                  Text(
                                    "Others",
                                    style: TextStyle(fontSize: 24),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),

                      SizedBox(height: 20),
                      TextField(
                          style: TextStyle(fontSize: 32),
                          controller: _countryController,
                          keyboardType: TextInputType.none,
                          decoration: InputDecoration(
                            label: Text("Country"),
                          ),
                          onTap: (() => showCountryPicker(
                              context: context,
                              showPhoneCode: false,
                              onSelect: (Country selectCountry) => setState(() {
                                    Provider.of<PageProvider>(context,
                                            listen: false)
                                        .user
                                        .country = selectCountry.name;
                                    Provider.of<PageProvider>(context,
                                            listen: false)
                                        .user
                                        .phoneCode = selectCountry.phoneCode;
                                    country = user.country!;
                                    _countryController.text = country;
                                    print(country);
                                  })))),
                      SizedBox(height: 20),
                      // DateRangePickerDialog(firstDate: DateTime(1900), lastDate: DateTime.now(),),
                      SizedBox(height: 20),
                      TextField(
                        style: TextStyle(fontSize: 32),
                        controller: _dateController,
                        onTap: () async {
                          Provider.of<PageProvider>(context, listen: false)
                              .user
                              .doa = (await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          ))!;
                          doa = user.doa;
                          _dateController.text = (doa.day.toString() +
                              "/" +
                              doa.month.toString() +
                              "/" +
                              doa.year.toString());
                        },
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.none,
                        decoration: InputDecoration(
                          label: Text("Date Of Arrival"),
                          hintText: "Enter the date you arrived",
                        ),
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
