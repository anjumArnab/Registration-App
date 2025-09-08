// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../model/user.dart';
import '../services/shared_pref.dart';
import '../main.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  User? user;

  void initUserData() {
    // Get user data using SharedPref service
    User? userData = SharedPref.getUserData();
    if (userData != null) {
      setState(() {
        user = userData;
      });
    }
  }

  void logout() async {
    // Set login status to false using SharedPref service
    await SharedPref.setLoginStatus(false);

    if (mounted) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const Wrapper()));
    }
  }

  @override
  void initState() {
    initUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        title: user != null
            ? Text("Welcome, ${user!.username}")
            : const Text("Welcome"),
        actions: [
          IconButton(onPressed: logout, icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: user != null
            ? Container(
                width: 300,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "User Information",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Divider(
                      color: Theme.of(context).primaryColor,
                      thickness: 1,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Username:",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(user!.username),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Email:",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(user!.email),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Phone no:",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(user!.phoneNo),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              )
            : const CircularProgressIndicator(
                color: Colors.white,
              ),
      ),
    );
  }
}
