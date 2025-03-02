import 'package:ecommerz/app/app_colors.dart';
import 'package:ecommerz/features/product/ui/screens/create_review_screen.dart';
import 'package:ecommerz/features/product/ui/widgets/product_review_widget.dart';
import 'package:flutter/material.dart';

class ProductReviewScreen extends StatefulWidget {
  const ProductReviewScreen({super.key});

  static const String name = '/product/review-screen';

  @override
  State<ProductReviewScreen> createState() => _ProductReviewScreenState();
}

class _ProductReviewScreenState extends State<ProductReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, childAspectRatio: 4, crossAxisSpacing: 10),
              itemCount: 10,
              itemBuilder: (context, index) {
                return const FittedBox(child: ProductReviewWidget());
              },
            ),
          ),
          _buildReviewAndAddReviewSection(),
        ],
      ),
    );
  }

  Container _buildReviewAndAddReviewSection() {
    return Container(
      height: 80,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withOpacity(0.2),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Reviews (1000)',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, CreateReviewScreen.name);
            },
            child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.themeColor,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 32,
                )),
          ),
        ],
      ),
    );
  }
}
