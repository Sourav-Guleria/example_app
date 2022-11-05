// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'api_call.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

import 'api_parsing/program_api_parsing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
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

class _MyHomePageState extends State<MyHomePage> {
  
  Future<ProgramApiParsing?> getData() async {
    var url =
        Uri.parse('https://632017e19f82827dcf24a655.mockapi.io/api/programs');
    http.Response response = await http.get(url);
    {
      if (response.statusCode == 200) {
        print(response.body);
        String data = response.body;
         print("From same class");
        var decodedData = ProgramApiParsing.fromJson(jsonDecode(response.body));
        return decodedData;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    }
  }

  @override
  void initState() {
    print("InitState");
    ProgramApiCall().getData();
    getData();
    print("InitState+++");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                const Text(
                  "Hello priya!",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
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
          SizedBox(
            height: 20,
          ),
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
          horizontalListView(),
          horizontalListView()

          // ListView.builder(
          //   physics: ScrollPhysics(),
          //   shrinkWrap: true,
          //   itemCount: 7,
          //   itemBuilder: (context, index) {
          //     // return
          //     // horizontalListView();
          //     return horizontalListView();
          //   },
          // )
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          onTap: (value) {
            // Respond to item press.
            // ignore: prefer_const_literals_to_create_immutables
          },
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
        return Container(
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
        );
      },
    );
  }

  Widget horizontalListView() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: FittedBox(
        fit: BoxFit.fill,
        alignment: Alignment.topCenter,
        child: Row(
          children: <Widget>[
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
                    Image.asset(
                      "assets/images/second_image.png",
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                        child: Text(
                      "LIFESTYLE",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.pink),
                    )),
                    SizedBox(
                      height: 10,
                    ),
                    Flexible(
                        child: Text(
                      "A complete guide for your new born baby",
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                        child: Text(
                      "16 Lessons",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                    )),
                  ],
                ),
              ),
            ),
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
                    Image.asset(
                      "assets/images/first_image.png",
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                        child: Text(
                      "LIFESTYLE",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.pink),
                    )),
                    SizedBox(
                      height: 10,
                    ),
                    Flexible(
                        child: Text(
                      "A complete guide for your new born baby",
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                        child: Text(
                      "16 Lessons",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                    )),
                  ],
                ),
              ),
            ),
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
                    Image.asset(
                      "assets/images/second_image.png",
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                        child: Text(
                      "LIFESTYLE",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.pink),
                    )),
                    SizedBox(
                      height: 10,
                    ),
                    Flexible(
                        child: Text(
                      "A complete guide for your new born baby",
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                        child: Text(
                      "16 Lessons",
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
      ),
    );
  }
}
