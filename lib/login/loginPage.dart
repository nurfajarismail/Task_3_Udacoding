import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_3/login/validLogin.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String username = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _key,
      appBar: AppBar(
        title: Text("Cek Login"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  children: [
                    TextFormField(
                      controller: usernameController,
                      // onSaved:(value )=> _username =value,

                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                        ),
                        hintText: "Username",
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: passwordController,
                      //  onSaved: (value) => _password =value,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                        ),
                        hintText: "Password",
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  width: double.infinity,
                  // width: 250,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          username = usernameController.text;
                          password = passwordController.text;
                          if (username == "udacodingid" &&
                              password == "udacodingJaya2021") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ValidPage()),
                            );
                            // } else if (username.contains("udacodingid")) {
                            //   print("Username harus udacodingid");
                            // } else if (password.contains("udacodingJaya2021")) {
                            //   print("Password harus udacodingJaya2021");
                          } else if (username == "") {
                            Fluttertoast.showToast(
                              msg: "Username tidak boleh kosong",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                            );
                            //print("Username tidak boleh kosong");
                          } else if (password == "") {
                            Fluttertoast.showToast(
                              msg: "Password tidak boleh kosong",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                            );
                            // print("Password tidak boleh kosong");
                          } else if (password.length < 6) {
                            Fluttertoast.showToast(
                              msg: "Password minimal 6 karakter",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                            );

                            //print("Password minimal 6 karakter");
                          } else {
                            Fluttertoast.showToast(
                              msg: "Username atau password salah",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                            );
                            // print("Username atau password salah");
                          }
                        });
                      },
                      child: Text(
                        "LOGIN",
                        style: TextStyle(color: Colors.white),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
