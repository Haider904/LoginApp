import 'package:flutter/material.dart';
import 'package:loginapp/Authenticate/methods.dart';
import 'package:loginapp/loginscreen.dart';

import 'homescreen.dart';

class createaccount extends StatefulWidget {
  createaccount({Key? key}) : super(key: key);

  @override
  _createaccountState createState() => _createaccountState();
}

class _createaccountState extends State<createaccount> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _email = new TextEditingController();
    TextEditingController _password = new TextEditingController();
    bool isloading = false;

    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue.shade400,
      body: isloading == true
          ? loader()
          : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height / 20,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                        onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
                  ),
                  Container(
                    width: size.width / 1.1,
                    child: Text(
                      "Welcome To Sign up Page",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 10,
                  ),
                  Container(
                    width: size.width / 1.1,
                    height: size.height / 14,
                    //color: Colors.blue,
                    child: TextField(
                      /*
                onChanged: (text) {
                  _email.text = text;
                  _email.selection =
                      TextSelection.collapsed(offset: _email.text.length);
                },
                */
                      controller: _email,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email_rounded,
                            color: Colors.blueGrey,
                          ),
                          hintText: "Email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 30,
                  ),
                  Container(
                    width: size.width / 1.1,
                    height: size.height / 14,
                    //color: Colors.blue,
                    child: TextField(
                      controller: _password,
                      cursorColor: Colors.black,
                      obscureText: true,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.password_rounded,
                            color: Colors.blueGrey,
                          ),
                          hintText: "Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      var _e = _email.text.toString().trim();
                      var _p = _password.text.toString().trim();
                      if (_e != "" && _p != "") {
                        setState(() {
                          isloading = true;
                        });
                        CreateAccount(_e, _p).then((user) {
                          setState(() {
                            isloading = false;
                          });
                          if (user == null)
                            print("An Error Occured");
                          else
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => loginscreen()));
                        });
                      } else
                        print("Please Enter Fields");
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: size.width / 1.1,
                      height: size.height / 14,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => loginscreen()));
                    },
                    child: Text(
                      "Signin",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget loader() {
    return Center(child: CircularProgressIndicator());
  }
}
