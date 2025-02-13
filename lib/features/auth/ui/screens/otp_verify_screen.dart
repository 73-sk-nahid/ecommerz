import 'dart:async';
import 'package:ecommerz/app/app_colors.dart';
import 'package:ecommerz/app/app_constants.dart';
import 'package:ecommerz/app/controller_binder.dart';
import 'package:ecommerz/features/auth/ui/controllers/otp_verify_controller.dart';
import 'package:ecommerz/features/auth/ui/widgets/app_logo_widget.dart';
import 'package:ecommerz/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:ecommerz/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:ecommerz/features/common/ui/widgets/snackbar_message.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:get/get.dart';

class OTPVerifyScreen extends StatefulWidget {
  const OTPVerifyScreen({super.key, required this.email});

  static const String name = '/otp-verify';
  final String email;

  @override
  State<OTPVerifyScreen> createState() => _OTPVerifyScreenState();
}

class _OTPVerifyScreenState extends State<OTPVerifyScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final OTPVerifyController _otpVerifyController = Get.find<OTPVerifyController>();
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

  void _startResendCodeTimer() {
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
                Text('A 4 Digit OTP Code has been Sent',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.grey,
                        )),
                const SizedBox(
                  height: 8,
                ),
                PinCodeTextField(
                  length: 4,
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
                GetBuilder<OTPVerifyController>(builder: (controller) {
                  if (controller.inProgress) {
                    return CenteredCircularProgressIndicator();
                  }
                  return ElevatedButton(
                      onPressed: _onTapNextButton,
                      child: const Text("Next"));
                }),
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
                  onPressed: enableResend ? _resendCode : null,
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

  void _resendCode() {
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

  void _onTapNextButton() async {
    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> userOTP() {
        return{
          "email" : widget.email,
          "otp" : _otpTEController.text.trim()
        };
      }
      bool isSuccess = await _otpVerifyController.verifyOTP(userOTP());
      if (isSuccess) {
        if (mounted) {
          Navigator.pushNamed(context, MainBottomNavScreen.name);
        }
      } else {
        if (mounted) {
          showSnackBarMessage(context, _otpVerifyController.errorMessage!);
        }
      }
    }
  }
}
