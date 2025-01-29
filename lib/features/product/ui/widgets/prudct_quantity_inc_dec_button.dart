import 'package:ecommerz/app/app_colors.dart';
import 'package:flutter/material.dart';

class ProductQuantityIncDecButton extends StatefulWidget {
  const ProductQuantityIncDecButton({super.key});

  @override
  State<ProductQuantityIncDecButton> createState() => _ProductQuantityIncDecButtonState();
}

class _ProductQuantityIncDecButtonState extends State<ProductQuantityIncDecButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.themeColor,
          ),
          alignment: Alignment.center,
          child: Icon(Icons.add),
        )
      ],
    );
  }
}
