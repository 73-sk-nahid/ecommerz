import 'package:ecommerz/features/auth/ui/screens/otp_verify_screen.dart';
import 'package:ecommerz/features/auth/ui/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  static const String name = '/complete-profile';

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _shippingAddressTEController =
      TextEditingController();
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
                //Mobile TextFormField
                TextFormField(
                  keyboardType: TextInputType.phone,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter Mobile Number'; // Check if empty
                    }
                    if (!RegExp(r"^(?:\+88|0088)?01[3-9]\d{8}$").hasMatch(value!)) {
                      return 'Enter Valid Mobile Number'; // Validate Bangladesh mobile number format
                    }
                    return null;
                  },

                  controller: _mobileTEController,
                  decoration: const InputDecoration(
                    hintText: "Mobile",
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
                ElevatedButton(
                    onPressed: () {
                      // if(_formKey.currentState!.validate()){}
                      // Navigator.pushNamed(context, OTPVerifyScreen.name);
                    },
                    child: const Text("Complete")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
