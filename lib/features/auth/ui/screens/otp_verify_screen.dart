import 'dart:async';

import 'package:ecommerz/app/app_colors.dart';
import 'package:ecommerz/app/app_constants.dart';
import 'package:ecommerz/features/auth/ui/screens/complete_profile_screen.dart';
import 'package:ecommerz/features/auth/ui/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPVerifyScreen extends StatefulWidget {
  const OTPVerifyScreen({super.key});

  static const String name = '/otp-verify';

  @override
  State<OTPVerifyScreen> createState() => _OTPVerifyScreenState();
}

class _OTPVerifyScreenState extends State<OTPVerifyScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late int secondsRemaining;
  bool enableResend = false;
  late Timer timer;

  @override
  void initState() {
    // TODO: implement initState
      super.initState();
      _startResendCodeTimer();
  }

  void _startResendCodeTimer(){
    secondsRemaining = AppConstants.resendOTPTimeoutInSec;
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        if (secondsRemaining > 0) {
          secondsRemaining--;
        } else {
          enableResend = true;
          timer.cancel(); // Cancel timer when countdown ends
        }
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    // Flutter Regex for Email Validation
    bool validateEmail(String? value) {
      const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
          r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
          r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
          r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
          r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
          r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
          r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
      final regex = RegExp(pattern);
      return regex.hasMatch(value!) ? true : false;
    }

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
                Text('Enter OTP Code',
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(
                  height: 8,
                ),
                Text('A 6 Digit OTP Code has been Sent',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.grey,
                        )),
                const SizedBox(
                  height: 8,
                ),
                PinCodeTextField(
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  animationDuration: const Duration(milliseconds: 300),
                  appContext: context,
                  controller: _otpTEController,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    selectedColor: Colors.green,
                    activeColor: AppColors.themeColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                    onPressed: () {
                      // if(_formKey.currentState!.validate()){}
                      //Navigator.pushNamedAndRemoveUntil(context, CompleteProfileScreen.name);
                      Navigator.pushNamed(context, CompleteProfileScreen.name);
                    },
                    child: const Text("Next")),
                const SizedBox(
                  height: 24,
                ),
                // TODO: enable TextButton when 120s in done either invisible the text in TextButton,

                RichText(
                    text: TextSpan(
                        text: "This code will be expire in ",
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                        children: [
                      TextSpan(
                        text: "$secondsRemaining s",
                        style: const TextStyle(
                          color: AppColors.themeColor,
                        ),
                      )
                    ])),
                TextButton(
                  onPressed:
                    enableResend ? _resendCode : null,
                  child: const Text(
                    "Resend Code",
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _resendCode(){
    setState(() {
      secondsRemaining = AppConstants.resendOTPTimeoutInSec;
      enableResend = false;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer.cancel();
    super.dispose();
  }
}
