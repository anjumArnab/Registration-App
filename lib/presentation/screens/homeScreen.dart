import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/userModel.dart';
import '../../main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SharedPreferences pref;
  User? user = null;

  @override
  void initState() {
    initPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent.shade100,
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent.shade100,
        title:
            user != null ? Text("Welcome, ${user!.username}") : Text("Welcome"),
        actions: [IconButton(onPressed: logout, icon: Icon(Icons.logout))],
      ),
      body: Center(
        child: user != null
            ? Card(
                color: Colors.white.withOpacity(0.9), // Light card color
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  width: 300, // Fixed card width
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "User Information",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                        ),
                      ),
                      Divider(
                        color: Colors.deepOrangeAccent,
                        thickness: 1,
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Username:",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text(user!.username),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Email:",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text(user!.email),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Phone no:",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text(user!.phoneNo),
                        ],
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              )
            : CircularProgressIndicator(
                color: Colors.white,
              ), // Show loader until data is available
      ),
    );
  }

  void initPreferences() async {
    pref = await SharedPreferences.getInstance();

    setState(() {
      user = User.fromJson(jsonDecode(pref.getString("userData")!));
    });
  }

  void logout() async {
    pref.setBool("isLogin", false);

    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => Wrapper()));
  }
}
