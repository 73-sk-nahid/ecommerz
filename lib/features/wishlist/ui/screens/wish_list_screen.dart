import 'package:ecommerz/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:ecommerz/features/wishlist/ui/controller/wish_list_controller.dart';
import 'package:ecommerz/features/wishlist/ui/widgets/wish_list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/ui/controllers/main_bottom_nav_controller.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  final WishListController _wishListController = Get.find<WishListController>();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadMoreData);
    _wishListController.getWishList();
  }

  void _loadMoreData() {
    if (_scrollController.position.extentAfter < 300) {
      _wishListController.getWishList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) => _onPop(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Wish List'),
          leading: IconButton(
              onPressed: _onPop,
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            Get.find<WishListController>().getWishList();
          },
          child: GetBuilder<WishListController>(
            builder: (controller) {
              if (controller.initialInProgress) {
                return const CenteredCircularProgressIndicator();
              }
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  Expanded(
                    child: GridView.builder(
                      controller: _scrollController,
                      itemCount: controller.wishList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: .7,
                              crossAxisSpacing: 4),
                      itemBuilder: (context, index) {
                        return FittedBox(
                          child: WishListItemWidget(
                            productModel: controller.wishList[index],
                          ),
                        );
                      },
                    ),
                  ),
                  Visibility(
                    visible: controller.inProgress,
                    child: const LinearProgressIndicator(),
                  ),
                ]),
              );
            },
          ),
        ),
      ),
    );
  }

  void _onPop() {
    Get.find<MainBottomNavController>().backToHome();
  }
}
