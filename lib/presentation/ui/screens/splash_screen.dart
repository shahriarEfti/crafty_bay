
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/email_verification_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../widgets/app_logo_widget.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<void> _movedToNextScreen() async{

    await Future.delayed( Duration(seconds: 2));
    await Get.find<AuthController>().getAccessToken();
    Get.off(() => MainBottomNavScreen());

  }

  @override
  void initState() {
    super.initState();
    _movedToNextScreen();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Center(

        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
             AppLogoWidget(),
              Spacer(),
              CircularProgressIndicator(),
              SizedBox(height: 16,),
              Text("version 1.0.1",style: TextStyle(
                color: Colors.grey
              ),)

            ],
          ),
        ),
      ),
    );
  }
}

