import 'package:ecommerz/app/app_colors.dart';
import 'package:ecommerz/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:ecommerz/features/product/ui/controller/product_review_controller.dart';
import 'package:ecommerz/features/product/ui/screens/add_review_screen.dart';
import 'package:ecommerz/features/product/ui/screens/create_review_screen.dart';
import 'package:ecommerz/features/product/ui/widgets/product_review_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductReviewScreen extends StatefulWidget {
  const ProductReviewScreen({super.key, required this.productId});

  final String productId;

  static const String name = '/product/review-screen';

  @override
  State<ProductReviewScreen> createState() => _ProductReviewScreenState();
}

class _ProductReviewScreenState extends State<ProductReviewScreen> {
  final ReviewListController _controller = Get.find<ReviewListController>();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(_loadMoreData);
    _controller.getReviewList(widget.productId);
  }

  void _loadMoreData() {
    if (_scrollController.position.extentAfter < 300) {
      _controller.getReviewList(widget.productId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _controller.refreshReviewList(widget.productId);
        },
        child: GetBuilder<ReviewListController>(builder: (controller) {
          if (controller.initialInProgress) {
            return const CenteredCircularProgressIndicator();
          }
          return Column(
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1, childAspectRatio: 4),
                  itemCount: controller.reviewList.length,
                  controller: _scrollController,
                  itemBuilder: (context, index) {
                    return FittedBox(
                        child: ProductReviewWidget(
                      reviewDataModel: controller.reviewList[index],
                    ));
                  },
                ),
              ),
              Visibility(
                child: const LinearProgressIndicator(),
                visible: controller.inProgress,
              ),
              _buildReviewAndAddReviewSection(controller.reviewList.length),
            ],
          );
        }),
      ),
    );
  }

  Container _buildReviewAndAddReviewSection(int reviewCount) {
    return Container(
      height: 80,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withOpacity(0.2),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Reviews ($reviewCount)',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, CreateReviewScreen.name);
            },
            child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.themeColor,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AddReviewScreen.name,
                        arguments: widget.productId);
                  },
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 32,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
