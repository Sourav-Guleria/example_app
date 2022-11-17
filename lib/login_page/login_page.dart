// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'dart:ui';

import 'package:example_app/home_page/home_page.dart';
import 'package:example_app/login_page/bloc/login_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  TextEditingController nameController = TextEditingController();
  TextEditingController paswordController = TextEditingController();
  String name = "";
  bool changedButton = false;
  final formKey = GlobalKey<FormState>();

  moveToHome() async {
    changedButton = true;
    callSharedPreferences();

    await Future.delayed(Duration(seconds: 1));
    await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MyHomePage(title: "Flutter")))
        .then((value) => Navigator.pop(context));

    changedButton = false;
  }

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBlocBloc(),
      child: Material(
        color: Colors.white,
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
                    BlocBuilder<LoginBlocBloc, LoginBlocState>(
                      builder: (context, state) {
                        if (state is LoginBlocerror) {
                          return Text(
                            state.eroor.toString(),
                            style: TextStyle(color: Colors.red),
                          );
                        }
                        return Container();
                      },
                    ),
                    BlocBuilder<LoginBlocBloc, LoginBlocState>(
                      builder: (context, state) {
                        return TextFormField(
                          controller: nameController,
                          onChanged: (value) {
                            BlocProvider.of<LoginBlocBloc>(context).add(
                                LoginTextChangeEvent(nameController.text,
                                    paswordController.text));
                          },
                          decoration: InputDecoration(
                              hintText: "Enter Username",
                              labelText: "Username"),
                        );
                      },
                    ),
                    BlocBuilder<LoginBlocBloc, LoginBlocState>(
                      builder: (context, state) {
                        return TextFormField(
                          controller: paswordController,
                          onChanged: (value) {
                            BlocProvider.of<LoginBlocBloc>(context).add(
                                LoginTextChangeEvent(nameController.text,
                                    paswordController.text));
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: "Enter Pasword", labelText: "Pasword"),
                        );
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    BlocBuilder<LoginBlocBloc, LoginBlocState>(
                      builder: (context, state) {
                        if (state is LoginBlocLoding) {
                          return Center(child: CircularProgressIndicator());
                        }
                        return ElevatedButton(
                          onPressed: () {
                            if (state is LoginBlocValid) {
                              BlocProvider.of<LoginBlocBloc>(context).add(
                                  LoginSubmitEvent(nameController.text,
                                      paswordController.text));
                              moveToHome();
                            }
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
                        );
                      },
                    )
                    // Material(
                    //   borderRadius:
                    //       BorderRadius.circular(changedButton ? 50 : 8),
                    //   color: Colors.blue,
                    //   child: InkWell(
                    //     onTap: () {
                    //       setState(() {
                    //         moveToHome();
                    //       });
                    //     },
                    //     child: AnimatedContainer(
                    //       alignment: Alignment.center,
                    //       width: changedButton ? 50 : 150,
                    //       height: 40,

                    //       //color: Colors.blue,
                    //       duration: Duration(seconds: 1),
                    //       child: changedButton
                    //           ? Icon(
                    //               Icons.done,
                    //               color: Colors.white,
                    //             )
                    //           : Text(
                    //               "Login",
                    //               style: TextStyle(
                    //                   color: Colors.white,
                    //                   fontWeight: FontWeight.bold,
                    //                   fontSize: 18),
                    //             ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  callSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', nameController.text.toString());
    print(nameController.text.toString());
  }
}
