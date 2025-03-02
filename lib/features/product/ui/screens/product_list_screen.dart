import 'package:ecommerz/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:ecommerz/features/common/ui/widgets/product_item_widget.dart';
import 'package:ecommerz/features/product/ui/controller/product_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.categoryName, required categoryId});

  final String categoryName;

  static const String name = '/product/product-list-by-category';

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ProductListController _productListController =
      Get.find<ProductListController>();
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadMoreData);
    _productListController.getProductList();
  }

  void _loadMoreData() {
    if (_scrollController.position.extentAfter < 300) {
      _productListController.getProductList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          Get.find<ProductListController>().getProductList();
        },
        child: GetBuilder<ProductListController>(builder: (controller) {
          if (controller.initialInProgress) {
            return const CenteredCircularProgressIndicator();
          }
          return Column(
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: .7,
                      crossAxisSpacing: 4),
                  itemCount: controller.productList.length,
                  controller: _scrollController,
                  itemBuilder: (context, index) {
                    return FittedBox(
                        child: ProductItemWidget(
                      productModel: controller.productList[index],
                    ));
                  },
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
