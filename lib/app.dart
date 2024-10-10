
import 'package:crafty_bay/presentation/ui/screens/splash_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/app_color.dart';
import 'package:flutter/material.dart';

class CraftyBayApp extends StatelessWidget {
  const CraftyBayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        progressIndicatorTheme:ProgressIndicatorThemeData(
          color: AppColor.themecolor
        )
      ),

      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
