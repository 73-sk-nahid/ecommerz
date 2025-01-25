import 'package:ecommerz/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:ecommerz/features/common/ui/widgets/category_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key});

  static const String name = '/Category-list-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category List'),
        leading: IconButton(
          onPressed: (){
            Get.find<MainBottomNavController>().backToHome();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: GridView.builder(
        itemCount: 20,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:4),
          itemBuilder: (context, index){
            return FittedBox(child: CategoryItemWidget());
          }),
    );
  }
}
