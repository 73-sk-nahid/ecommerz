import 'package:ecommerz/app/app_colors.dart';
import 'package:ecommerz/app/const_strings.dart';
import 'package:ecommerz/features/auth/ui/controllers/login_user_controller.dart';
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
  final LoginUserController _loginUserController = Get.find<LoginUserController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppLogoWidget(),
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
                  if (!RegExp(Strings.emailRegex).hasMatch(value!)) {
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
                obscureText: passwordVisible,
                controller: _passwordTEController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                    hintText: 'Enter password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        passwordVisible ? Icons.visibility_off : Icons.visibility,
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
                height: 16,
              ),
              GetBuilder<LoginUserController>(builder: (controller) {
                if (controller.inProgress) {
                  return CenteredCircularProgressIndicator();
                }
                return ElevatedButton(
                onPressed: _onTapNextButton,
                child: const Text('Log In'));
                }),
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

  @override
  void initState() {
    // TODO: implement initState
    passwordVisible = false;
    super.initState();
  }
}
