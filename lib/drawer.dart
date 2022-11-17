import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => DrawerScreenState();
}

class DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
          padding: const EdgeInsets.all(30),
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: const CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            AssetImage("assets/images/profile_image.png")),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Emily Cyrus",
                    style: TextStyle(
                        color: Color.fromRGBO(227, 109, 166, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const ListTile(
                title: Text(
                  "Home",
                  style: TextStyle(
                      color: Color.fromARGB(255, 4, 101, 181),
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
              ),
              Container(
                color: const Color.fromARGB(255, 243, 237, 237),
                height: 1,
              ),
              const ListTile(
                title: Text(
                  "Book A Nanny",
                  style: TextStyle(
                      color: Color.fromARGB(255, 4, 101, 181),
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
              ),
              Container(
                color: const Color.fromARGB(255, 243, 237, 237),
                height: 1,
              ),
              const ListTile(
                title: Text(
                  "How It Works",
                  style: TextStyle(
                      color: Color.fromARGB(255, 4, 101, 181),
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
              ),
              Container(
                color: const Color.fromARGB(255, 243, 237, 237),
                height: 1,
              ),
              const ListTile(
                title: Text(
                  "Why Nanny Vanny",
                  style: TextStyle(
                      color: Color.fromARGB(255, 4, 101, 181),
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
              ),
              Container(
                color: const Color.fromARGB(255, 243, 237, 237),
                height: 1,
              ),
              const ListTile(
                title: Text(
                  "My Bookings",
                  style: TextStyle(
                      color: Color.fromARGB(255, 4, 101, 181),
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
              ),
              Container(
                color: const Color.fromARGB(255, 243, 237, 237),
                height: 1,
              ),
              const ListTile(
                title: Text(
                  "My Profile",
                  style: TextStyle(
                      color: Color.fromARGB(255, 4, 101, 181),
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
              ),
              Container(
                color: const Color.fromARGB(255, 243, 237, 237),
                height: 1,
              ),
              const ListTile(
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
      );
    
  }
}