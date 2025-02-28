import 'package:ecommerz/features/common/data/model/category/category_pagination_model.dart';
import 'package:ecommerz/features/product/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import '../../../../app/app_colors.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({super.key, required this.categoryModel});

  final CategoryItemModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductListScreen.name, arguments: {
          'categoryName': categoryModel.title ?? '',
          'categoryId': categoryModel.sId ?? ''
        });
      },
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.themeColor.withValues(alpha: 0.10),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.network(
                categoryModel.icon ?? '',
                width: 40,
                height: 40,
                fit: BoxFit.scaleDown,
              )
              ),
          const SizedBox(
            height: 4,
          ),
          Text(
            categoryModel.title ?? '',
            style: const TextStyle(
                fontSize: 16,
                color: AppColors.themeColor,
                fontWeight: FontWeight.w500),
          ),

        ],
      ),
    );
  }
}
