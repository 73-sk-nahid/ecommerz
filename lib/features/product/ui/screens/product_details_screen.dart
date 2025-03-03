import 'package:ecommerz/app/app_colors.dart';
import 'package:ecommerz/features/cart/ui/controller/add_to_cart_controller.dart';
import 'package:ecommerz/features/cart/ui/screens/cart_list_screen.dart';
import 'package:ecommerz/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:ecommerz/features/common/ui/widgets/snackbar_message.dart';
import 'package:ecommerz/features/product/data/model/product_details_model.dart';
import 'package:ecommerz/features/product/ui/controller/product_details_controller.dart';
import 'package:ecommerz/features/product/ui/screens/product_review_screen.dart';
import 'package:ecommerz/features/product/ui/widgets/color_picker_widget.dart';
import 'package:ecommerz/features/product/ui/widgets/product_image-carousel_slider.dart';
import 'package:ecommerz/features/common/ui/widgets/prudct_quantity_inc_dec_button.dart';
import 'package:ecommerz/features/product/ui/widgets/size_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final String productId;

  static const String name = '/product/product-details';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<ProductDetailsController>().getProductDetails(widget.productId);
    print(ProductDetails.getDefaultList('current_price'));
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: GetBuilder<ProductDetailsController>(builder: (controller) {
        if (controller.inProgress) {
          return const CenteredCircularProgressIndicator();
        }
        if (controller.errorMessage != null) {
          return Center(
            child: Text(controller.errorMessage!),
          );
        }

        ProductDetails productDetails = controller.productDetails!;
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ProductImageCarouselSlider(
                      imageUrls: [
                        productDetails.photos!.first,
                        productDetails.photos!.first,
                        productDetails.photos!.first,
                        productDetails.photos!.first,
                      ],
                    ),
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
                                      productDetails.title ?? '',
                                      style: textTheme.titleMedium,
                                    ),
                                    Row(
                                      children: [
                                        const Wrap(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 18,
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              '4.5',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.grey),
                                            )
                                          ],
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pushNamed(context, ProductReviewScreen.name, arguments: widget.productId);
                                            },
                                            child: const Text('Reviews')),
                                        Container(
                                          padding: const EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                            color: AppColors.themeColor,
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          child: const Icon(
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
                              const SizedBox(
                                width: 8,
                              ),
                              ProductQuantityIncDecButton(
                                onChange: (int value) {},
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Color',
                            style: textTheme.titleMedium,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          ColorPickerWidget(
                            colors: const ['Red', 'Green', 'Yellow', 'Blue'],
                            onColorSelected: (String selectedColor) {},
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Size',
                            style: textTheme.titleMedium,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SizePickerWidget(
                            sizes: productDetails.sizes ?? [],
                              //sizes: ['S', 'M', 'L', 'XL', 'XXL'],
                              onSizeSelected: (String selectedSize) {}),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Description',
                            style: textTheme.titleMedium,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            productDetails.description ?? '',
                            // loremIpsum(
                            //     words: 120, paragraphs: 5, initWithLorem: true),
                            style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildPriceAndAddToCartSection(textTheme, controller.productDetails!.currentPrice ?? 0,controller.productDetails!.sId ?? ''),
          ],
        );
      }),
    );
  }

  Container _buildPriceAndAddToCartSection(TextTheme textTheme, int price, String id) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withOpacity(0.2),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Price',
                style: textTheme.titleSmall,
              ),
              Text(
                price.toString(),
                style: const TextStyle(
                    color: AppColors.themeColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
            ],
          ),
          SizedBox(
            width: 120,
            child: GetBuilder<AddToCartController>(
              builder: (controller) {
                if(controller.inProgress) {
                  return const CenteredCircularProgressIndicator();
                }
                return ElevatedButton(onPressed: () async{
                  bool isSuccess = await Get.find<AddToCartController>().addToCart(id);
                  if (isSuccess) {
                    if (mounted) {
                      Navigator.pushNamed(context, CartListScreen.name);
                    }
                  } else {
                    /*if (mounted) {
                      showSnackBarMessage(context, _loginUserController.errorMessage!);
                    }*/
                  }
                }, child: const Text('Add to Cart'));
              }
            ),
          ),
        ],
      ),
    );
  }
}
