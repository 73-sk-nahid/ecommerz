import 'package:ecommerz/app/app_colors.dart';
import 'package:ecommerz/app/assets_path.dart';
import 'package:ecommerz/features/common/ui/widgets/prudct_quantity_inc_dec_button.dart';
import 'package:flutter/material.dart';

class CartProductItemWidget extends StatelessWidget {
  const CartProductItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 16.0),
        child: Row(
          children: [
            Image.asset(
              AssetsPath.dummyImagePng,
              width: 90,
              height: 90,
              fit: BoxFit.scaleDown,
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                'Nike Shoe - AK45394 New Year Deal',
                                maxLines: 1,
                                style: textTheme.bodyLarge
                                    ?.copyWith(overflow: TextOverflow.ellipsis),
                              ),
                               Row(
                                children: [
                                  Text('Color: Red'),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text('Size: XL'),
                                ],
                              )
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.delete_outlined)),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$100',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.themeColor),
                        ),
                        ProductQuantityIncDecButton(
                          onChange: (int noOfItem) {},
                        )
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}