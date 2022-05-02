import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:underfitters_app/form%20pages/form2.dart';
import 'package:underfitters_app/form%20pages/page_provider.dart';
import 'package:underfitters_app/models/user.dart';

import 'form pages/form1.dart';
import 'form pages/form3.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List pages = [Form1(), Form2(), Form3()];
  final PageController _controller = PageController();
  FToast fToast = FToast();
  double pageNo = 0;

  @override
  void initState() {
    fToast = FToast();
    fToast.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserModel user = Provider.of<PageProvider>(context).user;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.only(bottom: 80),
        child: PageView.builder(
          controller: _controller,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: pages.length,
          itemBuilder: (context, currentPage) {
            return pages[currentPage];
          },
        ),
      ),
      bottomSheet: Container(
          height: 80,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(offset: Offset(0, -5), blurRadius: 15)]),
          child: pageNo != 2
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton.icon(
                          onPressed: () {
                            if (user.name != "" &&
                                user.age != 0 &&
                                user.country != "") {
                                  setState(() {
                              pageNo++;
                            });
                              _controller.nextPage(
                                  duration: Duration(microseconds: 1000),
                                  curve: Curves.ease);
                            } else {
                              fToast.showToast(
                                  fadeDuration: 500,
                                  child: Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: Theme.of(context).splashColor,
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: Text(
                                        "Please fill all the details",
                                        style: TextStyle(fontSize: 18),
                                      )));
                            }
                            
                            print(user.name);
                            
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(100))),
                              elevation: MaterialStateProperty.all(4),
                              backgroundColor: MaterialStateProperty.all(
                                  Theme.of(context).splashColor)),
                          icon: Icon(
                            Icons.arrow_right_alt,
                            color: Colors.white,
                            size: 50,
                          ),
                          label: Text("")),
                    )
                  ],
                )
              : null),
    );
  }
}
