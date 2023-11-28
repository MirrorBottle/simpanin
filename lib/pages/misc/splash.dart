import 'dart:convert';

import 'package:simpanin/models/user.dart';
import 'package:simpanin/pages/auth/log_in.dart';
import 'package:simpanin/services/auth_service.dart';
import 'package:simpanin/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:simpanin/pages/misc/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 2));

    await Future.delayed(const Duration(seconds: 2)).then(
      (_) => goTo(),
    );
  }

  void goTo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirst = prefs.getBool('isFirst') ?? true;
    bool isLogin = prefs.getBool('isLogin') ?? false;
    if (isFirst) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    } else {
      if (isLogin) {
        String encodedAuth = prefs.getString('auth') ?? "{}";
        Map<String, dynamic> auth = json.decode(encodedAuth);
        UserModel user = await UserService.getUser(auth['id']);
        String authData = json.encode(user.toMap());
        prefs.setString('auth', authData);
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => const MainScreen()),
        // );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LogInScreen()),
        );
      }
    }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image(
              image: AssetImage('assets/img/logo_full.png'),
              height: 120,
            ),
          )
        ],
      ),
    );
  }
}
