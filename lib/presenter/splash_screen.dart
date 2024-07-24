import 'package:flutter/material.dart';
import 'package:numeroid/core/locator.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: appTheme.colors.brand.blue,
      child: Image.asset('assets/images/logo_large.png'),
    );
  }
}
