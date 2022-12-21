import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/Authenticate/methods.dart';
import 'package:loginapp/createaccount.dart';
import 'homescreen.dart';
import 'package:email_auth/email_auth.dart';

class loginscreen extends StatefulWidget {
  @override
  _loginscreenstate createState() => _loginscreenstate();
}

class _loginscreenstate extends State<loginscreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _email = new TextEditingController();
    TextEditingController _password = new TextEditingController();

    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue.shade400,
      body: Column(
        children: [
          SizedBox(
            height: size.height / 20,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child:
                IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
          ),
          Container(
            width: size.width / 1.1,
            child: Text(
              "Welcome To Login Screen",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
                Sigin(_e, _p).then((user) {
                  if (user != null) {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => homescreen()));
                  } else {
                    print("SignIn Error");
                  }
                });
              } else
                print("Please Enter fields");
            },
            child: Container(
              alignment: Alignment.center,
              width: size.width / 1.1,
              height: size.height / 14,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Text(
                "SignIn",
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
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => createaccount()));
            },
            child: Text(
              "Create Account",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
