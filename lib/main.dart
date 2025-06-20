import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/homeScreen.dart';
import '../screens/loginScreen.dart';

void main() {
  runApp(const SharedPref());
}

class SharedPref extends StatelessWidget {
  const SharedPref({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registration',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Wrapper(),
    );
  }
}

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  late SharedPreferences pref;
  bool? isLoggedIn = false;

  @override
  void initState() {
    initPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoggedIn == true ? const HomeScreen() : const LoginScreen();
  }

  void initPreferences() async {
    pref = await SharedPreferences.getInstance();
    setState(() {
      isLoggedIn = pref.getBool("isLogin");
    });
  }
}
