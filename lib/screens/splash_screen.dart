import 'package:ecommerce_damex/screens/auth/login.dart';
import 'package:ecommerce_damex/screens/components/colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        color: primaryColor,
        child: Center(
          child: InkWell(
              child: Image.asset('images/logos/logo.png'),
              onTap: () => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Login()),
                  (route) => false)),
        ),
      ),
    );
  }
}
