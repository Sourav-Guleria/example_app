// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:example_app/home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  String name = "";
  bool changedButton = false;
  final formKey = GlobalKey<FormState>();

  moveToHome() async {
    if(formKey.currentState!.validate()){
       setState(() {
      changedButton = true;
    });
    await Future.delayed(Duration(seconds: 1));
    await Navigator.push(context,
        MaterialPageRoute(builder: (context) => MyHomePage(title: "Flutter")));
    setState(() {
      changedButton = false;
    });
    
    }
  }

  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Image.asset("assets/images/first_image.png", fit: BoxFit.cover),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Welcome $name",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if(value!.isEmpty){
                          return "Username cannot be empty";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          name = value;
                        });
                      },
                      decoration: InputDecoration(
                          hintText: "Enter Username", labelText: "Username"),
                    ),
                    TextFormField(
                      validator: (value) {
                        if(value!.isEmpty){
                          return "Password cannot be empty";
                        }else if(value.length<6){
                            return "Password lenth should be 6";
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter Pasword", labelText: "Pasword"),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Material(
                      borderRadius:
                          BorderRadius.circular(changedButton ? 50 : 8),
                      color: Colors.blue,
                      child: InkWell(
                        onTap:() {
                          moveToHome();
                        },
                        child: AnimatedContainer(
                          alignment: Alignment.center,
                          width: changedButton ? 50 : 150,
                          height: 40,

                          //color: Colors.blue,
                          duration: Duration(seconds: 1),
                          child: changedButton
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future callSharedPreferences() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    sp.setString("name", "");

    // name = sp.getString("name".toString())!;
  }
}
