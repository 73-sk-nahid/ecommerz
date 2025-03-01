import 'package:ecommerz/features/product/ui/screens/product_details_screen.dart';
import 'package:ecommerz/features/wishlist/data/model/wish_list_product_model.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class WishListItemWidget extends StatelessWidget {
  const WishListItemWidget({
    super.key, required this.productModel
  });
  final WishListProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductDetailsScreen.name, arguments: 1);
      },
      child: SizedBox(
        width: 140,
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: AppColors.themeColor.withValues(alpha: 0.08),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16))),
                child: Image.network(
                  productModel.photos?.isNotEmpty == true ? productModel.photos!.first :
                  'https://pngimg.com/d/free_PNG90740.png',
                  width: 140,
                  height: 80,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      productModel.title ?? "",
                      maxLines: 1,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${(productModel.currentPrice ?? 0).toString()}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.themeColor,
                          ),
                        ),
                        Wrap(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 18,
                            ),
                            Text(
                              '4.5',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColors.themeColor,
                              ),
                            )
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: AppColors.themeColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Icon(
                            Icons.delete_outlined,
                            size: 14,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}