import 'package:flutter/material.dart';
import 'package:post_api_login/main.dart';

class second extends StatefulWidget {
  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome User"),
              SizedBox(
                height: 50,
              ),
              OutlinedButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyHomePage()));
                  },
                  icon: Icon(Icons.exit_to_app, size: 18),
                  label: Text("Logout")),
            ],
          ),
        ),
      ),
    );
  }
}
