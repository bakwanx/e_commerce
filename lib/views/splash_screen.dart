import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../providers/product_provider.dart';
import '../utils/prefs_key.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int userId = 0;
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    SharedPreferences.getInstance().then((valueShared) async {
      await Provider.of<ProductProvider>(context, listen: false).getProducts().then((value){
        Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 160,
          height: 180,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/image_splash.png',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
