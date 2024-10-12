import 'package:crafty_bay/presentation/ui/screens/complete_profile_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/app_color.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {

  final TextEditingController _otpTEController = TextEditingController();

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
              Text("Enter OTP Code ", style: Theme.of(context).textTheme.headlineLarge),
              SizedBox(height: 8,),
              Text("A 4 digit otp has been sent ",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey),),
              SizedBox(height: 24,),
              PinCodeTextField(
                length: 6,

                animationType: AnimationType.fade,
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.white,
                  selectedFillColor: Colors.white,
                  selectedColor: Colors.green,
                  inactiveFillColor: Colors.white,
                  inactiveColor: AppColor.themecolor,
                ),
                animationDuration: Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                enableActiveFill: true,
                controller: _otpTEController,
               appContext: context
              ),
              SizedBox(height: 24,),
              ElevatedButton(
        
        
        
                  onPressed: _onTapNext, child: Text('Next')),
              SizedBox(height: 16,),
              RichText(text: TextSpan(
                text: 'This code will exprire in ',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey),
                children:const [ TextSpan(
                  text: '120s',
                  style: TextStyle(color: AppColor.themecolor)

                ),
                ]

              )),
              SizedBox(height: 16,),
              TextButton(onPressed: (){}, child:Text("Resend Code"))

              
            ],
          ),
        ),
      ),

    );


  }
  void _onTapNext (){
    Get.to(()=>const CompleteProfileScreen());

  }
  @override
  void dispose() {
 _otpTEController.dispose();
    super.dispose();
  }

}

