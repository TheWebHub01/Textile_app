import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:textile_app/Screens/Home/home_screen.dart';
import 'package:textile_app/Screens/Login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    selectscreen();
  }

  Future<void> selectscreen() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Future.delayed(
        const Duration(seconds: 3),
        () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const PurchaseOutstanding(),
              ));
        },
      );
    } else {
      Future.delayed(
        const Duration(seconds: 3),
        () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ));
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: const Color(0xff0D5785),
          ),
          SvgPicture.asset("assets/svg/bg.svg"),
          Center(child: SvgPicture.asset("assets/svg/splash_logo.svg")),
        ],
      ),
    );
  }
}
