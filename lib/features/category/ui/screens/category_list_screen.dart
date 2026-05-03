import 'package:ecommerce/core/widgets/centered_progress_indicator.dart';
import 'package:ecommerce/features/common/ui/controllers/category_controller.dart';
import 'package:ecommerce/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:ecommerce/features/common/ui/widgets/app_bar.dart';
import 'package:ecommerce/features/common/ui/widgets/category_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  final CategoryController _categoryController =Get.find<CategoryController>();
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_categoryController.getCategoryList();
    _scrollController.addListener(loadMore);

  }
  Future<void> loadMore()async{
    if(_scrollController.position.extentAfter<300){
      await _categoryController.getCategoryList();
    }
  }
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_,_){_onPop();},
      child: Scaffold(
        appBar: AppBarWidget(title: 'Categories', onTapBack: _onPop),
        body: GetBuilder<CategoryController>(
          builder: (controller) {
            if(controller.isInitialLoading){
              return CenteredProgressIndicator();
            }
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: RefreshIndicator(
                onRefresh: (){
                  return _categoryController.onRefresh();
                },
                child: Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        controller: _scrollController,
                        itemCount: controller.categoryList.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 16,
                      ), itemBuilder: (ctx,index){
                        return FittedBox(child: CategoryItem(model: controller.categoryList[index],));
                      }),
                    ),
                    Visibility(
                      visible: controller.isLoading,
                        child: LinearProgressIndicator())
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }
  void _onPop(){
    Get.find<MainBottomNavController>().backToHome();
  }
}

