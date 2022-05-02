import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:underfitters_app/home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  "InNeed",
                  textAlign: TextAlign.center,
                  style:
                      GoogleFonts.montserrat(fontSize: 50, color: Colors.white),
                ),
              ),
              SizedBox(height: 50),
              Text(
                "Login",
                style: TextStyle(fontSize: 38),
              ),
              TextField(
                decoration: InputDecoration(
                    label: Text("UID"),
                    hintText: "Enter uid given during registration",
                    hintStyle: TextStyle(fontSize: 18)),
              ),
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                    label: Text("Password"),
                    hintText: "enter uid given during ",
                    hintStyle: TextStyle(fontSize: 18)),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {},
                child: Text("Submit"),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                    padding: MaterialStateProperty.all(EdgeInsets.all(15))),
              ),
              SizedBox(height: 40),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Home();
                    }));
                  },
                  child: Text("Or Register"))
            ]),
      ),
    );
  }
}
