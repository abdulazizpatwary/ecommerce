import 'package:ecommerce/app/assets_path.dart';
import 'package:ecommerce/core/widgets/centered_progress_indicator.dart';
import 'package:ecommerce/features/common/data/models/category_item_model.dart';
import 'package:ecommerce/features/common/data/models/product_model.dart';
import 'package:ecommerce/features/common/ui/controllers/add_to_wish_list_controller.dart';
import 'package:ecommerce/features/common/ui/controllers/category_controller.dart';
import 'package:ecommerce/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:ecommerce/features/common/ui/widgets/category_item_widget.dart';
import 'package:ecommerce/features/common/ui/widgets/product_item_widget.dart';
import 'package:ecommerce/features/home/ui/controllers/product_list_by_tag_controller.dart';
import 'package:ecommerce/features/home/ui/widgets/appbar_action_button.dart';
import 'package:ecommerce/features/home/ui/widgets/carousel_slider_widget.dart';
import 'package:ecommerce/features/home/ui/widgets/home_section_header_widget.dart';
import 'package:ecommerce/features/home/ui/widgets/productSearchBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String name = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchBar = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

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
              HomeSctionHeader(title: 'All Categories', onTap: () {
                Get.find<MainBottomNavController>().moveToCategory();
              }),
              SizedBox(height: 8),
              _buildHomeCategoryList(),
              SizedBox(height: 8),

              GetBuilder<ProductListByTagController>(
                builder: (controller) {
                  return Column(
                    children: [
                      HomeSctionHeader(title: 'Popular', onTap: () {}),
                      SizedBox(height: 8),
                      Visibility(
                          visible:controller.isInitialLoading==false,
                          replacement: SizedBox(height:100,child:CenteredProgressIndicator()),
                          child: _buildProductItemListbyExclusivity(controller.popularProductList.isNotEmpty?controller.popularProductList:controller.newProductList)),
                      SizedBox(height: 8),
                      HomeSctionHeader(title: 'Special', onTap: () {}),
                      SizedBox(height: 8),
                      Visibility(
                          visible:controller.isInitialLoading==false,
                          replacement: SizedBox(height:100,child:CenteredProgressIndicator()),
                          child: _buildProductItemListbyExclusivity(controller.specialProductList.isNotEmpty?controller.specialProductList:controller.newProductList)),
                      SizedBox(height: 8),
                      HomeSctionHeader(title: 'New', onTap: () {}),
                      SizedBox(height: 8),
                      Visibility(
                          visible:controller.isInitialLoading==false,
                          replacement: SizedBox(height:100,child:CenteredProgressIndicator()),
                          child: _buildProductItemListbyExclusivity(controller.newProductList)),
                    ],
                  );
                }
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }



  Widget _buildProductItemListbyExclusivity(List<ProductModel>modelList) {
    List<ProductModel> list = modelList.length>10?modelList.sublist(0,10):modelList;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:list.map((e){
          return ProductItemWidget(model: e, icon: Icons.favorite_border_outlined, onTapFavourite: () {
            Get.find<AddToWishListController>().addToWishList(e.id);
          },);
        }).toList() ,
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
  Widget _buildHomeCategoryList() {
    return GetBuilder<CategoryController>(
      builder: (controller) {
        List<CategoryItemModel>categoryList= controller.categoryList.length<10?controller.categoryList:controller.categoryList.sublist(0,10);
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: _getCategoryItemList(categoryList)),
        );
      }
    );
  }

  List<Widget> _getCategoryItemList(List<CategoryItemModel>categoryList) {

    List<Widget> catergoryItems = [];
    for (int i = 0; i < categoryList.length; i++) {
      catergoryItems.add(
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: CategoryItem(model: categoryList[i],),
        ),
      );
    }
    return catergoryItems;
  }
}
