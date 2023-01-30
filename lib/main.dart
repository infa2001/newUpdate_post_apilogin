import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:post_api_login/second.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePgaeState();
}

class _MyHomePgaeState extends State<MyHomePage> {
  var emailController = TextEditingController();
  var passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.email)),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: passController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.password)),
                ),
                SizedBox(
                  height: 45,
                ),
                OutlinedButton.icon(
                    onPressed: () {
                      login();
                    },
                    icon: const Icon(
                      Icons.login,
                      size: 18,
                    ),
                    label: const Text("Login")),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //CREATE FUNCTION TO CALL LOGIN POST API
  Future<void> login() async {
    if (passController.text.isNotEmpty && emailController.text.isNotEmpty) {
      var response = await http.post(
          Uri.parse(
              "https://chilledcurry-api.azurewebsites.net:443//api/Customer/Login"),
          body: ({
            'email': emailController.text,
            'password': passController.text
          }));
      if (response.statusCode == 200) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => second()));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid Credentials.")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Black Field Not Allowed")));
    }
  }
}
