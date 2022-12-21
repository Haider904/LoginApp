import 'package:flutter/material.dart';

import 'Authenticate/methods.dart';

class homescreen extends StatefulWidget {
  @override
  _homescreenstate createState() => _homescreenstate();
}

class _homescreenstate extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.logout),
          onTap: () {
            logout(context);
          },
        ),
      ),
    );
  }
}
