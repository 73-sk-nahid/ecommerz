import 'package:ecommerz/app/app_colors.dart';
import 'package:ecommerz/app/app_constants.dart';
import 'package:ecommerz/features/auth/ui/controllers/login_user_controller.dart';
import 'package:ecommerz/features/auth/ui/screens/email_verify_screen.dart';
import 'package:ecommerz/features/auth/ui/screens/signup_screen.dart';
import 'package:ecommerz/features/auth/ui/widgets/app_logo_widget.dart';
import 'package:ecommerz/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:ecommerz/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:ecommerz/features/common/ui/widgets/snackbar_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String name = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final LoginUserController _loginUserController =
      Get.find<LoginUserController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool passwordVisible = false;

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
                height: 160,
              ),
              const AppLogoWidget(),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _emailTEController,
                decoration: const InputDecoration(
                  hintText: 'E-mail Address',
                ),
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return 'Enter Email Address'; // Check if empty
                  }
                  if (!RegExp(AppConstants.emailRegex).hasMatch(value!)) {
                    return 'Enter Valid Email Address'; // Validate Bangladesh mobile number format
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: !passwordVisible,
                controller: _passwordTEController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                    hintText: 'Enter password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: AppColors.themeColor,
                      ),
                      onPressed: () {
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                    )),
                validator: (String? value) {
                  if (value?.trim().isEmpty == true) {
                    return 'Enter Password';
                  }
                  if (value!.trim().length < 6) {
                    return 'Enter valid password';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: _verifyEmail,
                      child: const Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.redAccent),
                  )),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              GetBuilder<LoginUserController>(builder: (controller) {
                if (controller.inProgress) {
                  return const CenteredCircularProgressIndicator();
                }
                return ElevatedButton(
                    onPressed: _onTapNextButton, child: const Text('Log In'));
              }),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: _createNewAccount,
                child: RichText(
                  text: const TextSpan(
                      text: 'Don\'t have any account?  ',
                      style: TextStyle(color: Colors.grey),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Create new account',
                          style: TextStyle(color: AppColors.themeColor),
                        )
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  void _onTapNextButton() async {
    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> userInfo() {
        return {
          "email": _emailTEController.text.trim(),
          "password": _passwordTEController.text.trim()
        };
      }

      bool isSuccess = await _loginUserController.logInUser(userInfo());
      if (isSuccess) {
        if (mounted) {
          Navigator.pushNamed(context, MainBottomNavScreen.name);
        }
      } else {
        if (mounted) {
          showSnackBarMessage(context, _loginUserController.errorMessage!);
        }
      }
    }
  }

  void _createNewAccount() {
    Navigator.pushNamed(context, SignUpScreen.name);
  }

  void _verifyEmail() {
    Navigator.pushNamed(context, EmailVerifyScreen.name);
  }

  @override
  void initState() {
    // TODO: implement initState
    passwordVisible = false;
    super.initState();
  }
}
