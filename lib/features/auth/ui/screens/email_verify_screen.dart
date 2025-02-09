import 'package:ecommerz/app/app_constants.dart';
import 'package:ecommerz/features/auth/ui/controllers/email_verify_controller.dart';
import 'package:ecommerz/features/auth/ui/screens/otp_verify_screen.dart';
import 'package:ecommerz/features/auth/ui/widgets/app_logo_widget.dart';
import 'package:ecommerz/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:ecommerz/features/common/ui/widgets/snackbar_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerifyScreen extends StatefulWidget {
  const EmailVerifyScreen({super.key});

  static const String name = '/email-verify';

  @override
  State<EmailVerifyScreen> createState() => _EmailVerifyScreenState();
}

class _EmailVerifyScreenState extends State<EmailVerifyScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final EmailVerifyController _emailVerifyController =
      Get.find<EmailVerifyController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                const AppLogoWidget(),
                const SizedBox(
                  height: 24,
                ),
                Text('Welcome Back',
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(
                  height: 8,
                ),
                Text('Please Enter your email address',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.grey,
                        )),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) // check is it empty
                    {
                      return 'Enter E-mail address';
                    }
                    if (!RegExp(AppConstants.emailRegex)
                        .hasMatch(value!)) {
                      return 'Enter Valid Email Address'; // Validate Bangladesh mobile number format
                    }
                    return null;
                  },
                  controller: _emailTEController,
                  decoration: const InputDecoration(
                    hintText: "Email Address",
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                //elevated button here
                GetBuilder<EmailVerifyController>(builder: (controller) {
                  if (controller.inProgress) {
                    return const CenteredCircularProgressIndicator();
                  }
                  return ElevatedButton(
                      onPressed: _onTapNextButton, child: const Text("Next"));
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapNextButton() async {
    if (_formKey.currentState!.validate()) {
      bool isSuccess = await _emailVerifyController
          .verifyEmail(_emailTEController.text.trim());
      if (isSuccess) {
        if (mounted) {
          Navigator.pushNamed(context, OTPVerifyScreen.name);
        }
      } else {
        if (mounted) {
          showSnackBarMessage(context, _emailVerifyController.errorMessage!);
        }
      }
    }
  }
}
