// ignore_for_file: prefer_const_constructors
// ignore: prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color.fromRGBO(227, 109, 166, 1)),
      ),
      endDrawer: Drawer(
        child: Container(
          padding: EdgeInsets.all(30),
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            AssetImage("assets/images/profile_image.png")),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Emily Cyrus",
                    style: TextStyle(
                        color: Color.fromRGBO(227, 109, 166, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              ListTile(
                title: Text(
                  "Home",
                  style: TextStyle(
                      color: Color.fromARGB(255, 4, 101, 181),
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
              ),
              Container(
                color: Color.fromARGB(255, 243, 237, 237),
                height: 1,
              ),
              ListTile(
                title: Text(
                  "Book A Nanny",
                  style: TextStyle(
                      color: Color.fromARGB(255, 4, 101, 181),
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
              ),
              Container(
                color: Color.fromARGB(255, 243, 237, 237),
                height: 1,
              ),
              ListTile(
                title: Text(
                  "How It Works",
                  style: TextStyle(
                      color: Color.fromARGB(255, 4, 101, 181),
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
              ),
              Container(
                color: Color.fromARGB(255, 243, 237, 237),
                height: 1,
              ),
              ListTile(
                title: Text(
                  "Why Nanny Vanny",
                  style: TextStyle(
                      color: Color.fromARGB(255, 4, 101, 181),
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
              ),
              Container(
                color: Color.fromARGB(255, 243, 237, 237),
                height: 1,
              ),
              ListTile(
                title: Text(
                  "My Bookings",
                  style: TextStyle(
                      color: Color.fromARGB(255, 4, 101, 181),
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
              ),
              Container(
                color: Color.fromARGB(255, 243, 237, 237),
                height: 1,
              ),
              ListTile(
                title: Text(
                  "My Profile",
                  style: TextStyle(
                      color: Color.fromARGB(255, 4, 101, 181),
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
              ),
              Container(
                color: Color.fromARGB(255, 243, 237, 237),
                height: 1,
              ),
              ListTile(
                title: Text(
                  "Support",
                  style: TextStyle(
                      color: Color.fromARGB(255, 4, 101, 181),
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                    radius: 40,
                    backgroundImage:
                        AssetImage("assets/images/profile_image.png")),
                // ignore: prefer_const_literals_to_create_immutables
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  // ignore: prefer_const_literals_to_create_immutables
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        "Welcome",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "Emily Cyrus",
                        style: TextStyle(
                            color: Color.fromRGBO(227, 109, 166, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(245, 181, 207, 1),
                  ),
                  padding: EdgeInsets.all(30),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        "Nany Baby \n Settings Services",
                        style: TextStyle(
                            color: Color.fromRGBO(38, 47, 113, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromRGBO(38, 47, 113, 1),
                        child: InkWell(
                          onTap: () {},
                          child: AnimatedContainer(
                            alignment: Alignment.center,
                            width: 100,
                            height: 40,
                            duration: Duration(seconds: 1),
                            child: Text(
                              "Book Now",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset("assets/images/mother_image.png")
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text("Your Current Booking",
                style: TextStyle(
                    color: Color.fromRGBO(38, 47, 113, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),
            Card(
              elevation: 1,
              child: Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Row(
                      children: [
                        Text(
                          "One Day package",
                          style: TextStyle(
                              color: Color.fromRGBO(227, 109, 166, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.normal),
                        ),
                        Spacer(),
                        Material(
                          borderRadius: BorderRadius.circular(15),
                          color: Color.fromRGBO(227, 109, 166, 1),
                          child: InkWell(
                            onTap: () {},
                            child: AnimatedContainer(
                              alignment: Alignment.center,
                              width: 100,
                              height: 30,
                              duration: Duration(seconds: 1),
                              child: Text(
                                "Start",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          "From",
                          style: TextStyle(fontSize: 12),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 150),
                          child: Text(
                            "To",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Icon(Icons.calendar_month,
                            color: Color.fromRGBO(227, 109, 166, 1)),
                        Text(
                          "12.08.2020",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Spacer(),
                        Icon(Icons.calendar_month,
                            color: Color.fromRGBO(227, 109, 166, 1)),
                        Padding(
                          padding: const EdgeInsets.only(right: 60),
                          child: Text(
                            "12.08.2020",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Icon(Icons.punch_clock,
                            color: Color.fromRGBO(227, 109, 166, 1)),
                        Text(
                          "11 pm",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Spacer(),
                        Icon(Icons.punch_clock,
                            color: Color.fromRGBO(227, 109, 166, 1)),
                        Padding(
                          padding: const EdgeInsets.only(right: 100),
                          child: Text(
                            "07 am",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Material(
                          borderRadius: BorderRadius.circular(15),
                          color: Color.fromRGBO(38, 47, 113, 1),
                          child: InkWell(
                            onTap: () {},
                            child: AnimatedContainer(
                                alignment: Alignment.center,
                                width: 100,
                                height: 30,
                                duration: Duration(seconds: 1),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Icon(Icons.star, color: Colors.white),
                                    Text(
                                      "Rate Us",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(15),
                          color: Color.fromRGBO(38, 47, 113, 1),
                          child: InkWell(
                            onTap: () {},
                            child: AnimatedContainer(
                                alignment: Alignment.center,
                                width: 100,
                                height: 30,
                                duration: Duration(seconds: 1),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Icon(Icons.location_city,
                                        color: Colors.white),
                                    Text(
                                      "Geolocation",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(15),
                          color: Color.fromRGBO(38, 47, 113, 1),
                          child: InkWell(
                            onTap: () {},
                            child: AnimatedContainer(
                                alignment: Alignment.center,
                                width: 100,
                                height: 30,
                                duration: Duration(seconds: 1),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Icon(Icons.cell_tower, color: Colors.white),
                                    Text(
                                      "Survillence",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Packages",
                style: TextStyle(
                    color: Color.fromRGBO(38, 47, 113, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromRGBO(245, 181, 207, 1),
              ),
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Icon(
                        Icons.calendar_month,
                        color: Color.fromRGBO(227, 109, 166, 1),
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromRGBO(227, 109, 166, 1),
                        child: InkWell(
                          onTap: () {},
                          child: AnimatedContainer(
                            alignment: Alignment.center,
                            width: 100,
                            height: 40,
                            duration: Duration(seconds: 1),
                            child: Text(
                              "Book Now",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        "One Day Package",
                        style: TextStyle(
                            color: Color.fromRGBO(38, 47, 113, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "RS. 2799",
                        style: TextStyle(
                            color: Color.fromRGBO(38, 47, 113, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam ")
                ],
              ),
            ),
               SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromRGBO(128, 171, 219, 1),
              ),
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Icon(
                        Icons.calendar_month,
                        color: Colors.white,
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromRGBO(0, 152, 208, 1),
                        child: InkWell(
                          onTap: () {},
                          child: AnimatedContainer(
                            alignment: Alignment.center,
                            width: 100,
                            height: 40,
                            duration: Duration(seconds: 1),
                            child: Text(
                              "Book Now",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        "One Day Package",
                        style: TextStyle(
                            color: Color.fromRGBO(38, 47, 113, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "RS. 2799",
                        style: TextStyle(
                            color: Color.fromRGBO(38, 47, 113, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam ")
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromRGBO(245, 181, 207, 1),
              ),
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Icon(
                        Icons.calendar_month,
                        color: Color.fromRGBO(227, 109, 166, 1),
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromRGBO(227, 109, 166, 1),
                        child: InkWell(
                          onTap: () {},
                          child: AnimatedContainer(
                            alignment: Alignment.center,
                            width: 100,
                            height: 40,
                            duration: Duration(seconds: 1),
                            child: Text(
                              "Book Now",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        "One Day Package",
                        style: TextStyle(
                            color: Color.fromRGBO(38, 47, 113, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "RS. 2799",
                        style: TextStyle(
                            color: Color.fromRGBO(38, 47, 113, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam ")
                ],
              ),
            ),
               SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromRGBO(128, 171, 219, 1),
              ),
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Icon(
                        Icons.calendar_month,
                        color: Colors.white,
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromRGBO(0, 152, 208, 1),
                        child: InkWell(
                          onTap: () {},
                          child: AnimatedContainer(
                            alignment: Alignment.center,
                            width: 100,
                            height: 40,
                            duration: Duration(seconds: 1),
                            child: Text(
                              "Book Now",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        "One Day Package",
                        style: TextStyle(
                            color: Color.fromRGBO(38, 47, 113, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "RS. 2799",
                        style: TextStyle(
                            color: Color.fromRGBO(38, 47, 113, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam ")
                ],
              ),
            ),
       
          ],
        ),
      )),
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
              label: "Packages",
              icon: Icon(Icons.percent),
            ),
           
            BottomNavigationBarItem(
              label: "Boking",
              icon: Icon(Icons.punch_clock),
            ),
            BottomNavigationBarItem(label: "Profil", icon: Icon(Icons.photo)),
          ]),
   
    );
  }
}
