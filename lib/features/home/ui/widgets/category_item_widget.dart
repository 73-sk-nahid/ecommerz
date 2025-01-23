import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.themeColor.withOpacity(0.04),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.computer_sharp,
            color: AppColors.themeColor,
            size: 40,
          ),
        ),
        const SizedBox(height: 4,),
        Text(
          'Electronics',
          style: const TextStyle(
            fontSize: 16,
            color: AppColors.themeColor,
            fontWeight: FontWeight.w500
          ),
        ),
      ],
    );
  }
}