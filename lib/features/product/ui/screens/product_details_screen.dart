import 'package:ecommerz/features/product/ui/widgets/product_image-carousel_slider.dart';
import 'package:ecommerz/features/product/ui/widgets/prudct_quantity_inc_dec_button.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final int productId;

  static const String name = '/product/product-details';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Column(
        children: [
          ProductImageCarouselSlider(),
          Row(
            children: [
              ProductQuantityIncDecButton(),
              Column(
              )
            ],
          )
        ],
      ),
    );
  }
}
