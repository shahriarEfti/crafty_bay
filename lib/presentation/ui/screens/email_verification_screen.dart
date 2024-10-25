import 'package:crafty_bay/presentation/state_holders/email_verification_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/otp_verification_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo_widget.dart';
import 'package:crafty_bay/presentation/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/snack_message.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final EmailVerificationController _emailVerificationController =
  Get.find<EmailVerificationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 82),
                const AppLogoWidget(),
                Text(
                  "Welcome Back",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  "Please Enter Your E-mail",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _emailTEController,
                  decoration: const InputDecoration(hintText: 'E-mail'),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter Your Email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                GetBuilder<EmailVerificationController>(
                    builder: (emailVerificationController) {
                      return Visibility(
                        visible: !emailVerificationController.inProgress,
                        replacement: const CenteredCircularProgressIndicator(),
                        child: ElevatedButton(
                          onPressed: _onTapNextScreen,
                          child: const Text('Next'),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onTapNextScreen() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    bool result = await _emailVerificationController
        .verifyEmail(_emailTEController.text.trim());

    if (result) {
      Get.to(() =>  OtpVerificationScreen(email: _emailTEController.text.trim(),));
    } else {
      if (mounted) {
        showSnackBarMessage(
          context,
          _emailVerificationController.errorMessage ?? 'Verification failed',
          true,
        );
      }
    }
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    super.dispose();
  }
}
