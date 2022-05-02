import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:underfitters_app/form%20pages/page_provider.dart';
import 'package:underfitters_app/models/user.dart';

class Form2 extends StatefulWidget {
  const Form2({Key? key}) : super(key: key);

  @override
  State<Form2> createState() => _Form2State();
}

class _Form2State extends State<Form2> {
  
  @override
  Widget build(BuildContext context) {
  UserModel user = Provider.of<PageProvider>(context).user;
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(20),
          child: Form(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                children: [
                  TextField(
                    onChanged: ((value) => setState(()=>user.phoneNo=value)),
                    style: TextStyle(fontSize: 32),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        prefix: Container(
                          padding: EdgeInsets.only(right: 8),
                          child: Text("+"+user.phoneCode.toString())),
                        label: Text("Mobile Number"),
                        hintText: "Mobile number (if any)"),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    onChanged: (value) => setState(()=>user.email=value),
                    style: TextStyle(fontSize: 32),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        label: Text("E-mail"),
                        hintText: "Email ID (if any)"),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    onChanged: (value) => setState(()=>user.address=value),
                    style: TextStyle(fontSize: 32),
                    maxLines: 3,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                        label: Text("Current Reisdance"),
                        hintText: "Address"),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    onChanged: (value) => setState(()=>user.rol=value),
                    style: TextStyle(fontSize: 32),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.streetAddress,
                    maxLines: 5,
                    decoration: InputDecoration(
                        label: Text("Reason of leaving"),
                        hintText: "Reason of leaving"),
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
