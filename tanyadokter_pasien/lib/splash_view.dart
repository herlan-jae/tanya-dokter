import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:tanyadokter_pasien/app/session_helper.dart';
import 'package:tanyadokter_pasien/core/constant/assets_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      _init();
    });
  }

  _init() async {
    initializeDateFormatting();
    final session = await SessionHelper.getUserSession();
    bool isLoggedIn = session["access_token"] != "";

    if (!mounted) return;

    if (isLoggedIn) {
      Navigator.of(context).pushReplacementNamed('/root');
    } else {
      Navigator.of(context).pushReplacementNamed('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(AssetsManager.logo, width: 200.0),
      ),
    );
  }
}
