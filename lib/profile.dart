import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:underfitters_app/login.dart';
import 'package:underfitters_app/models/user.dart';

import 'form pages/page_provider.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    UserModel user = Provider.of<PageProvider>(context).user;

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            "Profile",
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: Colors.white),
          ),
          actions: [
            TextButton.icon(
                onPressed: () async {
                  final SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  pref.clear();
                  Navigator.popAndPushNamed(context, "/");
                },
                icon: Icon(
                  Icons.logout,
                  color: Colors.white,
                  size: 40,
                ),
                label: Text(""))
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundColor: Theme.of(context).primaryColor,
                  child: CircleAvatar(
                      radius: 90, backgroundImage: FileImage(user.picture!)),
                ),
                SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).splashColor, width: 3),
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name:",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text(
                              "${user.name}",
                              style: TextStyle(fontSize: 24),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Age:",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text(
                              "${user.age}",
                              style: TextStyle(fontSize: 24),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Gender:",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text(
                              "${user.gender}",
                              style: TextStyle(fontSize: 24),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Country:",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text(
                              "${user.country}",
                              style: TextStyle(fontSize: 24),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Contact Number:",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text(
                              "+${user.phoneCode + " " + user.phoneNo}",
                              style: TextStyle(fontSize: 24),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Email:",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text(
                              "${user.email}",
                              style: TextStyle(fontSize: 24),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Address:",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text(
                              "${user.address}",
                              style: TextStyle(fontSize: 24),
                            )
                          ],
                        ),
                      ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
