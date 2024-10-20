import 'package:crafty_bay/presentation/ui/screens/otp_verification_screen.dart';

import 'package:crafty_bay/presentation/ui/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              const SizedBox(height: 82,),
              const AppLogoWidget(),
              Text("Complete Profile  ", style: Theme.of(context).textTheme.headlineLarge),
              const SizedBox(height: 8,),
              Text("Get started with your details",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey),),
              const SizedBox(height: 16,),
              TextFormField(
                controller: _firstnameTEController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  hintText: 'First Name'
                ),
              ),
              const SizedBox(height: 16,),
              TextFormField(
                controller: _lastnameTEController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                    hintText: 'Last Name'
                ),
              ),
              const SizedBox(height: 16,),
              TextFormField(
                controller: _phoneTEController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: 'Phone'
                ),
              ),
              const SizedBox(height: 16,),
              TextFormField(
                controller: _cityTEController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                    hintText: 'City'
                ),
              ),
              const SizedBox(height: 16,),
              TextFormField(
                controller: _addressTEController,
                textInputAction: TextInputAction.next,
                maxLines: 4,
                decoration: const InputDecoration(

                    hintText: 'Address'
                ),
              ),
              const SizedBox(height: 16,),
              ElevatedButton(
        
        
        
                  onPressed: _onTapNextScreen, child: const Text('Complete')),
              
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

