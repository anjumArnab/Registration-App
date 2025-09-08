import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'services/shared_pref.dart';
import 'screens/homepage.dart';
import 'screens/login_screen.dart';

void main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize SharedPreferences
  await SharedPref.init();

  runApp(const SharedPrefApp());
}

class SharedPrefApp extends StatelessWidget {
  const SharedPrefApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registration',
      theme: ThemeData(
	scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.poppinsTextTheme(),
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
  bool? isLoggedIn = false;

  @override
  void initState() {
    initLoginStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoggedIn == true ? const Homepage() : const LoginScreen();
  }

  void initLoginStatus() {
    // Get login status using SharedPref service
    bool loginStatus = SharedPref.getLoginStatus();
    setState(() {
      isLoggedIn = loginStatus;
    });
  }
}
