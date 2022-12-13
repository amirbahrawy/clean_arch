import 'dart:async';
import 'package:clean_architecture/presentation/resources/constants_manager.dart';
import 'package:clean_architecture/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import '../../resources/assets_manager.dart';
import '../../resources/colors_manager.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  _startDelay(){
    _timer=Timer(const Duration(seconds: AppConstants.splashDelay), _goNext);
  }
  void _goNext() {
    Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(child: Image(image: AssetImage(ImageAssets.splashLogo))),
    );
  }
}


