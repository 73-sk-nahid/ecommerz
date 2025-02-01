import 'package:ecommerz/app/app_colors.dart';
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
        title: Text('Reviews'),
      ),
      body: Column(
        children: [
          Expanded(child: Text('data'), ),
          _buildReviewAndAddReviewSection(),

        ],
      ),
    );
  }

  Container _buildReviewAndAddReviewSection() {
    return Container(
          height: 80,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.themeColor.withOpacity(0.2),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Reviews (1000)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
              Container(
                padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.themeColor,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Icon(Icons.add, color: Colors.white, size: 32,)),
            ],
          ),
        );
  }
}
