import 'package:ecommerz/app/assets_path.dart';
import 'package:ecommerz/features/common/data/model/category_list_model.dart';
import 'package:ecommerz/features/common/data/model/category_model.dart';
import 'package:ecommerz/features/common/ui/controllers/category_list_controller.dart';
import 'package:ecommerz/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:ecommerz/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:ecommerz/features/home/ui/controller/slider_list_controller.dart';
import 'package:ecommerz/features/home/ui/widgets/app_bar_icon_button.dart';
import 'package:ecommerz/features/home/ui/widgets/home_carousel_slider.dart';
import 'package:ecommerz/features/home/ui/widgets/product_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../common/ui/widgets/category_item_widget.dart';
import '../widgets/home_section_header.dart';
import '../../../common/ui/widgets/product_item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String name = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchBarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                _sizedBox16(),
                ProductSearchBar(controller: _searchBarController),
                _sizedBox16(),
                GetBuilder<SliderListController>(
                  builder: (controller) {
                    if (controller.inProgress) {
                      return const SizedBox(
                        height: 180,
                        child: CenteredCircularProgressIndicator(),
                      );
                    }
                    return HomeCarouselSlider(
                      sliderList: controller.sliderList,
                    );
                  },
                ),
                _sizedBox8(),
                HomeSectionHeader(
                  title: 'Category',
                  onTap: () {
                    Get.find<MainBottomNavController>().moveToCategory();
                  },
                ),
                _sizedBox8(),
                GetBuilder<CategoryListController>(builder: (controller) {
                  if (controller.inProgress) {
                    return const SizedBox(
                      height: 100,
                      child: CenteredCircularProgressIndicator(),
                    );
                  }
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      // children: _getCategoryList(controller.categoryList),
                    ),
                  );
                }),
                _sizedBox8(),
                HomeSectionHeader(
                  title: 'Popular',
                  onTap: () {},
                ),
                _sizedBox8(),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _getProductList(),
                  ),
                ),
                _sizedBox8(),
                HomeSectionHeader(
                  title: 'Special',
                  onTap: () {},
                ),
                _sizedBox8(),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _getProductList(),
                  ),
                ),
                _sizedBox8(),
                HomeSectionHeader(
                  title: 'New',
                  onTap: () {},
                ),
                _sizedBox8(),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _getProductList(),
                  ),
                ),
                _sizedBox8(),
              ],
            ),
          ),
        ));
  }

  SizedBox _sizedBox8() {
    return const SizedBox(
      height: 8,
    );
  }

  SizedBox _sizedBox16() {
    return const SizedBox(
      height: 16,
    );
  }

  // List<Widget> _getCategoryList() {
  //   List<Widget> categoryList = [];
  //   for (int i = 0; i < 10; i++) {
  //     categoryList.add(const Padding(
  //       padding: EdgeInsets.only(right: 8.0),
  //       child: CategoryItemWidget(),
  //     ));
  //   }
  //   return categoryList;
  // }

  List<Widget> _getCategoryList(List<CategoryModel> categoryModels) {
    List<Widget> categoryList = [];
    for (int i = 0; i < categoryModels.length; i++) {
      // categoryList.add(
      //   Padding(
      //     padding: const EdgeInsets.only(right: 16.0),
      //     child: CategoryItemWidget(
      //       categoryModel: categoryModels[i],
      //     ),
      //   ),
      // );
    }
    return categoryList;
  }

  List<Widget> _getProductList() {
    List<Widget> productList = [];
    for (int i = 0; i < 10; i++) {
      productList.add(const Padding(
        padding: EdgeInsets.only(right: 8.0),
        child: ProductItemWidget(),
      ));
    }
    return productList;
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.appLogoNav),
      actions: [
        AppBarIconButton(
          icon: Icons.person_2_outlined,
          onTap: () {},
        ),
        const SizedBox(
          width: 8,
        ),
        AppBarIconButton(
          icon: Icons.call,
          onTap: () {},
        ),
        const SizedBox(
          width: 8,
        ),
        AppBarIconButton(
          icon: Icons.notifications_active_outlined,
          onTap: () {},
        ),
        const SizedBox(
          width: 8,
        ),
      ],
    );
  }
}
