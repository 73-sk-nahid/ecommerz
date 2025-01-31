import 'package:ecommerz/app/app_colors.dart';
import 'package:ecommerz/features/product/ui/widgets/color_picker_widget.dart';
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
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                ProductImageCarouselSlider(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'Nike Shoe A2ERF - New Year Special Deal Save 30%',
                                  style: textTheme.titleMedium,
                                ),
                                Row(
                                  children: [
                                    Wrap(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 18,
                                        ),
                                        const SizedBox(width: 4,),
                                        Text(
                                          '4.5',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey
                                          ),
                                        )
                                      ],
                                    ),
                                    TextButton(onPressed: (){}, child: Text('Reviews')),
                                    Container(
                                      padding: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        color: AppColors.themeColor,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Icon(
                                        Icons.favorite_border,
                                        size: 14,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8,),
                          ProductQuantityIncDecButton(
                            onChange: (int value) {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 8,),
                      Text('Color', style: textTheme.titleMedium,),
                      const SizedBox(height: 8,),
                      ColorPickerWidget(colors: ['Red', 'Green', 'Yellow', 'Blue'],
                      onColorselected: (String selectedColor){},),
                    ],
                  ),
                ),
              ],
            ),
          ),
          _buildPriceAndAddToCartSection(textTheme),
        ],
      ),
    );
  }

  Container _buildPriceAndAddToCartSection(TextTheme textTheme) {
    return Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: AppColors.themeColor.withOpacity(0.2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    'Price',
                    style: textTheme.titleSmall,
                  ),
                  Text(
                    '\$100',
                    style: TextStyle(
                        color: AppColors.themeColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                ],
              ),
              SizedBox(
                width: 120,
                child: ElevatedButton(
                    onPressed: () {}, child: Text('Add to Cart')),
              ),
            ],
          ),
        );
  }
}
