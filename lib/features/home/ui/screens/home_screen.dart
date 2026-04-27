import 'package:ecommerce/app/assets_path.dart';
import 'package:ecommerce/features/home/ui/widgets/appbar_action_button.dart';
import 'package:ecommerce/features/home/ui/widgets/carousel_slider_widget.dart';
import 'package:ecommerce/features/home/ui/widgets/category_item_widget.dart';
import 'package:ecommerce/features/home/ui/widgets/home_section_header_widget.dart';
import 'package:ecommerce/features/home/ui/widgets/productSearchBar.dart';
import 'package:ecommerce/features/home/ui/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String name = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchBar = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(height: 16),
              ProductSearchBar(searchBarController: _searchBar),
              SizedBox(height: 16),
              CarouselSliderWidget(),
              SizedBox(height: 8),
              HomeSctionHeader(title: 'All Categories', onTap: () {}),
              SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: _getCategoryItemList()),
              ),
              SizedBox(height: 8),
              HomeSctionHeader(title: 'Popular', onTap: () {}),
              SizedBox(height: 8),
              _buildProductItemListbyExclusivity(),
              SizedBox(height: 8),
              HomeSctionHeader(title: 'Special', onTap: () {}),
              SizedBox(height: 8),
              _buildProductItemListbyExclusivity(),
              SizedBox(height: 8),
              HomeSctionHeader(title: 'New', onTap: () {}),
              SizedBox(height: 8),
              _buildProductItemListbyExclusivity(),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductItemListbyExclusivity() {
    return SizedBox(
      height: 188,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ProductItemWidget(),
          );
        },
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.navLogoSvg),
      actions: [
        AppBarActionButton(icon: Icons.person_outlined, onTap: () {}),
        SizedBox(width: 8),
        AppBarActionButton(icon: Icons.call, onTap: () {}),
        SizedBox(width: 8),
        AppBarActionButton(
          icon: Icons.notifications_active_outlined,
          onTap: () {},
        ),
      ],
    );
  }

  List<Widget> _getCategoryItemList() {
    List<Widget> catergoryItems = [];
    for (int i = 0; i < 10; i++) {
      catergoryItems.add(
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: CategoryItem(),
        ),
      );
    }
    return catergoryItems;
  }
}
