import 'package:ecommerz/app/app_colors.dart';
import 'package:ecommerz/features/cart/data/model/cart_list_product_model.dart';
import 'package:ecommerz/features/cart/ui/controller/cart_list_controller.dart';
import 'package:ecommerz/features/cart/ui/widgets/cart_product_item_widget.dart';
import 'package:ecommerz/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:ecommerz/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});


  static const String name = '/cart-list';

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  final CartListController _cartListController = Get.find<CartListController>();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadMoreData);
    _cartListController.getCartList();
  }

  void _loadMoreData() {
    if (_scrollController.position.extentAfter < 300) {
      _cartListController.getCartList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) => _onPop(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          leading: IconButton(
              onPressed: _onPop, icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: RefreshIndicator(
          onRefresh: () async{
            Get.find<CartListController>().refreshCartList();
          },
          child: GetBuilder<CartListController>(
            builder: (controller) {
              if(controller.initialInProgress) {
                return const CenteredCircularProgressIndicator();
              }
              return Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                        controller: _scrollController,
                          itemCount: _cartListController.cartList.length,
                          itemBuilder: (context, index) {
                            return CartProductItemWidget(
                              cartProductModel: controller.cartList[index],
                            );
                          })),
                  _buildTotalPriceAndCheckoutSection(textTheme, controller.cartList),
                ],
              );
            }
          ),
        ),
      ),
    );
  }

  void _onPop() {
    Get.find<MainBottomNavController>().backToHome();
  }

  Container _buildTotalPriceAndCheckoutSection(TextTheme textTheme, List<CartProductModel> cartList) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withOpacity(0.2),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Price',
                style: textTheme.titleSmall,
              ),
              Text(
                '\$${cartList.fold<int>(0, (sum, item) => sum + (item.currentPrice ?? 0))}',
                style: const TextStyle(
                    color: AppColors.themeColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
            ],
          ),
          SizedBox(
            width: 120,
            child: ElevatedButton(onPressed: () {
            }, child: const Text('Checkout')),
          ),
        ],
      ),
    );
  }
}

