import 'package:crafty_bay/presentation/ui/screens/otp_verification_screen.dart';

import 'package:crafty_bay/presentation/ui/widgets/app_logo_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {

  final TextEditingController _firstnameTEController = TextEditingController();
  final TextEditingController _lastnameTEController = TextEditingController();
  final TextEditingController _phoneTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _addressTEController = TextEditingController();

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
              Text("Complete Profile  ", style: Theme.of(context).textTheme.headlineLarge),
              SizedBox(height: 8,),
              Text("Get started with your details",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey),),
              SizedBox(height: 16,),
              TextFormField(
                controller: _firstnameTEController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: 'First Name'
                ),
              ),
              SizedBox(height: 16,),
              TextFormField(
                controller: _lastnameTEController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    hintText: 'Last Name'
                ),
              ),
              SizedBox(height: 16,),
              TextFormField(
                controller: _phoneTEController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'Phone'
                ),
              ),
              SizedBox(height: 16,),
              TextFormField(
                controller: _cityTEController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    hintText: 'City'
                ),
              ),
              SizedBox(height: 16,),
              TextFormField(
                controller: _addressTEController,
                textInputAction: TextInputAction.next,
                maxLines: 4,
                decoration: InputDecoration(

                    hintText: 'Address'
                ),
              ),
              SizedBox(height: 16,),
              ElevatedButton(
        
        
        
                  onPressed: _onTapNextScreen, child: Text('Complete')),
              
            ],
          ),
        ),
      ),
    );


    }
  void _onTapNextScreen (){
    Get.to(()=> const OtpVerificationScreen());

  }
  @override
  void dispose() {
 _addressTEController.dispose();
 _cityTEController.dispose();
 _firstnameTEController.dispose();
 _lastnameTEController.dispose();
 _phoneTEController.dispose();
    super.dispose();
  }

}

