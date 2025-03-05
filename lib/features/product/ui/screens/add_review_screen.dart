import 'package:ecommerz/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:ecommerz/features/product/ui/controller/add_review_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddReviewScreen extends StatefulWidget {
  const AddReviewScreen({super.key, required this.productID});

  final String productID;

  static const String name = '/add-review';

  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _reviewTEController = TextEditingController();
  final TextEditingController _ratingTEController = TextEditingController();
  final AddReviewController _addReviewController = Get.find<AddReviewController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Review'),
        leading: IconButton(
            onPressed: (){}, icon: const Icon(Icons.arrow_back_ios)),
        elevation: 0.1,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _firstNameTEController,
                  decoration: const InputDecoration(hintText: 'First Name'),
                  validator: (String? value){
                    if(value?.trim().isEmpty ?? true){
                      return 'Enter First Name';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _lastNameTEController,
                  decoration: const InputDecoration(hintText: 'Last Name'),
                  validator: (String? value){
                    if(value?.trim().isEmpty ?? true){
                      return 'Enter Last Name';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _ratingTEController,
                  decoration: const InputDecoration(hintText: 'Rating'),
                  validator: (String? value){
                    if(value?.trim().isEmpty ?? true){
                      return 'Enter Rating';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _reviewTEController,
                  maxLines: 5,
                  decoration: const InputDecoration(hintText: 'Write Review'),
                  validator: (String? value){
                    if(value?.trim().isEmpty ?? true){
                      return 'Review Please';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                GetBuilder<AddReviewController>(
                  builder: (controller) {
                    if(controller.inProgress){
                      return const CenteredCircularProgressIndicator();
                    }
                    return ElevatedButton(
                      onPressed: _onTapNextButton,
                      child: const Text('Submit'),
                    );
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapNextButton() async {
    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> reviewInfo() {
        return {
          "product" : widget.productID,
          "comment": _reviewTEController.text.trim(),
          "rating": _ratingTEController.text.trim()
        };
      }

      bool isSuccess = await _addReviewController.addReview(reviewInfo());
      if (isSuccess) {
        if (mounted) {
          Navigator.pop(context);
        }
      } else {
        if (mounted) {
          // showSnackBarMessage(context, AddReviewScreen.errorMessage);
        }
      }
    }
  }
}
