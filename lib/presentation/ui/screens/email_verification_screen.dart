import 'package:crafty_bay/presentation/ui/screens/otp_verification_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/app_color.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {

  final TextEditingController _emailTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              SizedBox(height: 82,),
              AppLogoWidget(),
              Text("Welcome Back ", style: Theme.of(context).textTheme.headlineLarge),
              SizedBox(height: 8,),
              Text("Please Enter Your Password",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey),),
              SizedBox(height: 16,),
              TextFormField(
                controller: _emailTEController,
                decoration: InputDecoration(
                  hintText: 'E-mail'
                ),
              ),
              SizedBox(height: 16,),
              ElevatedButton(
        
        
        
                  onPressed: _onTapNextScreen, child: Text('Next')),
              
            ],
          ),
        ),
      ),
    );


    }
  void _onTapNextScreen (){
    Get.to(()=>const OtpVerificationScreen());

  }
  @override
  void dispose() {
 _emailTEController.dispose();
    super.dispose();
  }

}

