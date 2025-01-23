import 'package:ecommerz/features/common/ui/widgets/category_item_widget.dart';
import 'package:flutter/material.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key});

  static const String name = '/Category-list-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category List'),
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
