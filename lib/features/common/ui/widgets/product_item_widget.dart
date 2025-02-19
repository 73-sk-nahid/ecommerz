import 'package:ecommerz/features/product/ui/screens/product_details_screen.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({
    super.key,
  });

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
                    color: AppColors.themeColor.withOpacity(0.08),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16))),
                child: Image.asset(
                  'assets/images/nike_shoe.png',
                  width: 140,
                  height: 80,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'Nike Shoe latest edition - RF45GH',
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
                          '\$100',
                          style: TextStyle(
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
                            Icons.favorite_border,
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