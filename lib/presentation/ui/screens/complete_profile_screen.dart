import 'package:crafty_bay/presentation/ui/screens/main_bottom_nav_screen.dart';
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

  final _formKey = GlobalKey<FormState>(); // Create a global key for the form

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form( // Wrap the Column in a Form widget
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 82,),
                const AppLogoWidget(),
                Text("Complete Profile", style: Theme.of(context).textTheme.headlineLarge),
                const SizedBox(height: 8,),
                Text(
                  "Get started with your details",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 16,),
                TextFormField(
                  controller: _firstnameTEController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(hintText: 'First Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null; // Return null if the input is valid
                  },
                ),
                const SizedBox(height: 16,),
                TextFormField(
                  controller: _lastnameTEController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(hintText: 'Last Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16,),
                TextFormField(
                  controller: _phoneTEController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: 'Phone'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    if (value.length < 10) { // Check for a minimum length, adjust as needed
                      return 'Phone number must be at least 10 digits';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16,),
                TextFormField(
                  controller: _cityTEController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(hintText: 'City'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your city';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16,),
                TextFormField(
                  controller: _addressTEController,
                  textInputAction: TextInputAction.next,
                  maxLines: 4,
                  decoration: const InputDecoration(hintText: 'Address'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16,),
                ElevatedButton(
                  onPressed: _onTapNextScreen,
                  child: const Text('Complete'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapNextScreen() {
    if (_formKey.currentState!.validate()) { // Validate the form
      // If the form is valid, proceed to the next screen
      Get.to(() => const MainBottomNavScreen());
    }
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
