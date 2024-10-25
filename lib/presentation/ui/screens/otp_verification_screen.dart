import 'dart:async';
import 'package:crafty_bay/presentation/state_holders/otp_verification_controller.dart';
import 'package:crafty_bay/presentation/state_holders/read_profile_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/complete_profile_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/app_color.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../utils/snack_message.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key, this.email});
  final String? email;

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final OtpVerificationController _otpVerificationController = Get.find<OtpVerificationController>();
  final ReadProfileController  _readProfileController = Get.find<ReadProfileController>();

  bool _isResendEnabled = false;
  int _start = 60;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _otpTEController.dispose();
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _isResendEnabled = false;
    _start = 120;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_start == 0) {
          _isResendEnabled = true;
          _timer.cancel();
        } else {
          _start--;
        }
      });
    });
  }

  Future<void> _onTapNext() async {
    if (_formKey.currentState!.validate()) {
      bool result = await _otpVerificationController.verifyOtp(widget.email!, _otpTEController.text);

      if (result) {
        final bool readProfileResult = await  _readProfileController.getProfileDetails(
            _otpVerificationController.accessToken);
        if(readProfileResult){

          if(Get.find<ReadProfileController>().isProfileCompleted){

            Get.offAll(()=>const MainBottomNavScreen());
          }else{
            if (mounted) {
              showSnackBarMessage(
                context,
                _readProfileController.errorMessage!,

              );
            }

          }
        }else{

          Get.off(() => const CompleteProfileScreen());

        }
      } else {
        if (mounted) {
          showSnackBarMessage(
            context,
            _otpVerificationController.errorMessage!,

          );
        }
      }
    }
  }

  Future<void> _onResendCode() async {
    if (_isResendEnabled) {

      _startTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 82),
              const AppLogoWidget(),
              Text(
                "Enter OTP Code",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 8),
              Text(
                "A 4 digit OTP has been sent",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 24),
              Form(
                key: _formKey,
                child: PinCodeTextField(
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
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  controller: _otpTEController,
                  appContext: context,
                ),
              ),
              const SizedBox(height: 24),
              GetBuilder<OtpVerificationController>(
                builder: (otpVerificationController) {
                  return Visibility(
                    visible: !otpVerificationController.inProgress,
                    child: ElevatedButton(
                      onPressed: otpVerificationController.inProgress
                          ? null
                          : _onTapNext,
                      child: const Text('Next'),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              RichText(
                text: TextSpan(
                  text: 'This code will expire in ',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.grey),
                  children: [
                    TextSpan(
                      text: '$_start s',
                      style: const TextStyle(color: AppColor.themecolor),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: _isResendEnabled ? _onResendCode : null,
                child: Text(
                  _isResendEnabled ? "Resend Code" : "Resend in $_start s",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
