import 'package:ecommerz/app/app_colors.dart';
import 'package:ecommerz/app/assets_path.dart';
import 'package:ecommerz/features/home/ui/widgets/app_bar_icon_button.dart';
import 'package:ecommerz/features/home/ui/widgets/home_carousel_slider.dart';
import 'package:ecommerz/features/home/ui/widgets/product_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/category_item_widget.dart';
import '../widgets/home_section_header.dart';

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
                const SizedBox(
                  height: 16,
                ),
                ProductSearchBar(controller: _searchBarController),
                const SizedBox(
                  height: 16,
                ),
                const HomeCarouselSlider(),
                const SizedBox(
                  height: 16,
                ),
                HomeSectionHeader(
                  title: 'Category',
                  onTap: () {},
                ),
                const SizedBox(height: 8,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _getCategoryList(),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                HomeSectionHeader(
                  title: 'Popular',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ));
  }

  List<Widget> _getCategoryList() {
    List<Widget> categoryList = [];
    for (int i = 0; i < 10; i++) {
      categoryList.add(Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: const CategoryItemWidget(),
      ));
    }
    return categoryList;
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
