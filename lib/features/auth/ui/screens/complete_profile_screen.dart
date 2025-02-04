import 'package:ecommerz/features/auth/ui/controllers/signup_user_controller.dart';
import 'package:ecommerz/features/auth/ui/models/user_model.dart';
import 'package:ecommerz/features/auth/ui/screens/otp_verify_screen.dart';
import 'package:ecommerz/features/auth/ui/widgets/app_logo_widget.dart';
import 'package:ecommerz/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:ecommerz/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:ecommerz/features/common/ui/widgets/snackbar_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  static const String name = '/complete-profile';

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _phoneTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _shippingAddressTEController =
      TextEditingController();
  final SignupUserController _signupUserController = Get.find<SignupUserController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                Text('Complete Profile',
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(
                  height: 8,
                ),
                Text('Get started with us with your details',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.grey,
                        )),
                const SizedBox(
                  height: 8,
                ),
                //First Name TextFormField
                TextFormField(
                  keyboardType: TextInputType.text,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) // check is it empty
                    {
                      return 'Enter First Name';
                    }
                    return null;
                  },
                  controller: _firstNameTEController,
                  decoration: const InputDecoration(
                    hintText: "First Name",
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                //Last Name TextFormField
                TextFormField(
                  keyboardType: TextInputType.text,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) // check is it empty
                    {
                      return 'Enter Last Name';
                    }
                    return null;
                  },
                  controller: _lastNameTEController,
                  decoration: const InputDecoration(
                    hintText: "Last Name",
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                //email TextFormField
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter Email Address'; // Check if empty
                    }
                    if (!RegExp(
                            r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
                            r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
                            r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
                            r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
                            r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
                            r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
                            r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])')
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
                  height: 8,
                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value) {
                    RegExp regex = RegExp(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                    if (value?.trim().isEmpty ?? true) {
                      return 'Please enter password';
                    } else {
                      if (!regex.hasMatch(value!)) {
                        return 'Enter valid password';
                      } else {
                        return null;
                      }
                    }
                  },
                  controller: _passwordTEController,
                  decoration: const InputDecoration(hintText: 'Enter Password'),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value) {
                    RegExp regex = RegExp(r'^(?:(?:\+|00)88|01)?\d{11}');
                    if (value?.trim().isEmpty ?? true) // check is it empty
                    {
                      return 'Enter phone Number';
                    }
                    if (!regex.hasMatch(value!)) {
                      return 'Enter Valid number';
                    }
                    return null;
                  },
                  controller: _phoneTEController,
                  decoration: const InputDecoration(
                    hintText: "Phone Number",
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                //City TextFormField
                TextFormField(
                  keyboardType: TextInputType.streetAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) // check is it empty
                    {
                      return 'Enter City';
                    }
                    return null;
                  },
                  controller: _cityTEController,
                  decoration: const InputDecoration(
                    hintText: "City",
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                //Shipping Address TextFormField
                TextFormField(
                  keyboardType: TextInputType.streetAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  maxLines: 3,
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) // check is it empty
                    {
                      return 'Enter Shipping Address';
                    }
                    return null;
                  },
                  controller: _shippingAddressTEController,
                  decoration: const InputDecoration(
                    hintText: "Shipping Address",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GetBuilder<SignupUserController>(builder: (controller) {
                  if (controller.inProgress) {
                    return const CenteredCircularProgressIndicator();
                  }
                  return ElevatedButton(
                    // if(_formKey.currentState!.validate()){}
                    // Navigator.pushNamed(context, OTPVerifyScreen.name);
                      onPressed: _onTapNextButton,
                      child: const Text("Complete"));
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
      UserModel newUser = UserModel(
          firstName: _firstNameTEController.text.trim(),
          lastName: _lastNameTEController.text.trim(),
          email: _emailTEController.text.trim(),
          password: _passwordTEController.text.trim(),
          phone: _phoneTEController.text.trim(),
          city: _cityTEController.text.trim());

      bool isSuccess = await _signupUserController.signUpUser(newUser);
      if (isSuccess) {
        if (mounted) {
          Navigator.pushNamed(context, MainBottomNavScreen.name);
        }
      } else {
        if (mounted) {
          showSnackBarMessage(context, _signupUserController.errorMessage!);
        }
      }
    }
  }
}
