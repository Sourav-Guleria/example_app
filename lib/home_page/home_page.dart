// ignore_for_file: prefer_const_constructors

import 'package:example_app/api_call.dart';
import 'package:example_app/api_parsing/lesson_api_parsing.dart';
import 'package:example_app/api_parsing/program_api_parsing.dart';
import 'package:example_app/home_page/cubit/home_cubit_cubit.dart';
import 'package:example_app/login_page/login_page.dart';
import 'package:example_app/login_page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  // Future<ProgramApiParsing?> fetchData() async {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubitCubit()..fetchData(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: const Icon(
            Icons.menu,
            color: Colors.grey,
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.comment, color: Colors.grey),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.notifications,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        // ignore: prefer_const_literals_to_create_immutables
        body: SingleChildScrollView(
          child: Column(children: [
            // ignore: prefer_const_constructors
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 17.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  BlocBuilder<HomeCubitCubit, HomeCubitState>(
                    builder: (context, state) {
                      if (state is HomeCubitLoaded) {
                        return Text(
                          "Hello " + state.uName,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        );
                      }
                      return Container();
                    },
                  ),
                  const Text(
                    "What do you wanna learn today?",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            gridViewWidget(),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(17, 0, 17, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(
                    "Programs for you",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Spacer(),
                  const Text(
                    "View all",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey),
                  ),
                  Icon(Icons.arrow_right),
                ],
              ),
            ),
            horizontalListView(),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(17, 0, 17, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(
                    "Lessons for you",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Spacer(),
                  const Text(
                    "View all",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey),
                  ),
                  Icon(Icons.arrow_right),
                ],
              ),
            ),
            horizontalList(),
          ]),
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            selectedFontSize: 14,
            unselectedFontSize: 14,
            onTap: (value) {},
            // ignore: prefer_const_literals_to_create_immutables
            items: [
              BottomNavigationBarItem(
                label: "Home",
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: "Lern",
                icon: Icon(Icons.library_books),
              ),
              BottomNavigationBarItem(
                label: "Hub",
                icon: Icon(Icons.menu),
              ),
              BottomNavigationBarItem(
                label: "Chat",
                icon: Icon(Icons.chat),
              ),
              BottomNavigationBarItem(label: "Profil", icon: Icon(Icons.photo)),
            ]),
      ),
    );
  }

  Widget gridViewWidget() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 4 / 2,
      ),
      shrinkWrap: true,
      itemCount: choices.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(choices[index].icon, color: Colors.blue),
                SizedBox(
                  width: 10,
                ),
                Text(choices[index].title,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue)),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget horizontalListView() {
    return BlocConsumer<HomeCubitCubit, HomeCubitState>(
      listener: (context, state) {
        if (state is HomeCubitFailed) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ));
        }
      },
      builder: (context, state) {
        if (state is HomeCubitInitial || state is HomeCubitLoding) {
          // fetchData();
          // fetchLessonData();
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is HomeCubitLoaded) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int i = 0; i < (state.data?.items?.length ?? 0); i++)
                  Container(
                    width: 270,
                    height: 270,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          i % 2 == 0
                              ? Image.asset(
                                  "assets/images/first_image.png",
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  "assets/images/second_image.png",
                                  fit: BoxFit.cover,
                                ),
                          SizedBox(
                            height: 5,
                          ),
                          Expanded(
                              child: Text(
                            state.data!.items![i].category.toString(),
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: Colors.pink),
                          )),
                          SizedBox(
                            height: 5,
                          ),
                          Flexible(
                              child: Text(
                            state.data!.items![i].name.toString(),
                            style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )),
                          SizedBox(
                            height: 5,
                          ),
                          Expanded(
                              child: Text(
                            "${state.data!.items?[i].lesson} lesson",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          )),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          );
        }
        return Container(
          height: 100,
          width: 400,
          color: Colors.green,
        );
      },
    );
  }

  Widget horizontalList() {
    return BlocConsumer<HomeCubitCubit, HomeCubitState>(
      listener: (context, state) {
        if (state is HomeCubitFailed) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ));
        }
      },
      builder: (context, state) {
        if (state is HomeCubitInitial || state is HomeCubitLoding) {
          // fetchData();
          // fetchLessonData();
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is HomeCubitLoaded) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int i = 0; i < (state.data1?.items?.length ?? 0); i++)
                  Container(
                    width: 270,
                    height: 270,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          i % 2 == 0
                              ? Image.asset(
                                  "assets/images/first_image.png",
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  "assets/images/second_image.png",
                                  fit: BoxFit.cover,
                                ),
                          SizedBox(
                            height: 5,
                          ),
                          Expanded(
                              child: Text(
                            state.data1!.items![i].category.toString(),
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: Colors.pink),
                          )),
                          SizedBox(
                            height: 5,
                          ),
                          Flexible(
                              child: Text(
                            state.data1!.items![i].name.toString(),
                            style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )),
                          SizedBox(
                            height: 5,
                          ),
                          Expanded(
                              child: Text(
                            "${state.data1!.items?[i].duration} lesson",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          )),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          );
        }
        return Container(
          height: 100,
          width: 400,
          color: Colors.green,
        );
      },
    );
  }
}

class Choice {
  const Choice({required this.title, required this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choices = <Choice>[
  Choice(title: 'Program', icon: Icons.home),
  Choice(title: 'Get Help', icon: Icons.help),
  Choice(title: 'Learn', icon: Icons.book),
  Choice(title: 'DD Tracker', icon: Icons.phone),
];
