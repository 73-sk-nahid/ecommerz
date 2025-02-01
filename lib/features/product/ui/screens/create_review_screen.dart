import 'package:flutter/material.dart';

class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({super.key});

  static const String name = '/product/create-product-review';

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Review'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16, top: 32),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'First Name'
                ),
              ),
              const SizedBox(height: 8,),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Last Name'
                ),
              ),
              const SizedBox(height: 8,),
              TextFormField(
                maxLines: 8,
                decoration: const InputDecoration(
                  hintText: 'Write Review'
                ),
              ),
              const SizedBox(height: 16,),
              ElevatedButton(onPressed: (){}, child: const Text('Submit')),
            ],
          ),
        ),
      )
    );
  }
}
