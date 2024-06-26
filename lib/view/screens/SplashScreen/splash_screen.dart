import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pp2/utils/constants.dart';
import 'package:pp2/utils/preferences.dart';
import 'package:pp2/utils/routing.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    decideNavigation();
  }

  decideNavigation() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(Pref.login_pref)) {
      if (prefs.getBool(Pref.login_pref) ?? false) {
        _navigatetohome();
      } else {
        _navigateToLogin();
      }
    }
    else{
      _navigateToLogin();
    }
  }

  _navigateToLogin() async {
    await Future.delayed(Duration(milliseconds: 3000), () {});
    Get.offNamed(AppRoutes.loginScreen);
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 3000), () {});
    Get.offNamed(AppRoutes.homeNavigationScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfbE30B5C),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              primaryLogo,
              width: 200,
              height: 200,
            ),
            SizedBox(height: 30),
            Text(
              'WAVE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
