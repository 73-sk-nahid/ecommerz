import 'package:ecommerz/features/auth/data/models/user_model.dart';
import 'package:ecommerz/features/auth/ui/controllers/user_profile_controller.dart';
import 'package:ecommerz/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfileScreen extends StatefulWidget {
  static const String name = '/user-profile';
  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController cityController = TextEditingController();

  bool emailVerified = true;

 bool phoneVerified = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final controller = Get.find<UserProfileController>();
    controller.updateUserData().then((_) {
      if (controller.userModel != null) {
        _populateFields(controller.userModel!);
      }
    });
  }

  void _populateFields(UserModel userModel) {
    setState(() {
      firstNameController.text = userModel.firstName ?? '';
      lastNameController.text = userModel.lastName ?? '';
      emailController.text = userModel.email ?? '';
      phoneController.text = userModel.phone ?? '';
      cityController.text = userModel.city ?? '';
      emailVerified = userModel.emailVerified ?? false;
      phoneVerified = userModel.phoneVerified ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Profile")),
      body: GetBuilder<UserProfileController>(
        builder: (controller) {
          if(controller.inProgress){
            return const CenteredCircularProgressIndicator();
          }
          if (controller.errorMessage != null) {
            return Center(
              child: Text(controller.errorMessage!),
            );
          }
          UserModel userModel = controller.userModel!;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(userModel.avatarUrl ?? ''),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildTextField("First Name", firstNameController),
                  _buildTextField("Last Name", lastNameController),
                  _buildTextField("Email", emailController),
                  _buildTextField("Phone", phoneController),
                  _buildTextField("City", cityController),
                  const SizedBox(height: 16),
                  _buildVerificationStatus(),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Save"),
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }

  Widget _buildTextField(String labelText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,

          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildVerificationStatus() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(emailVerified ? Icons.check_circle : Icons.cancel, color: emailVerified ? Colors.green : Colors.red),
                const SizedBox(width: 8),
                Text("Email Verified: ${emailVerified ? "Yes" : "No"}"),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(phoneVerified ? Icons.check_circle : Icons.cancel, color: phoneVerified ? Colors.green : Colors.red),
                const SizedBox(width: 8),
                Text("Phone Verified: ${phoneVerified ? "Yes" : "No"}"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
