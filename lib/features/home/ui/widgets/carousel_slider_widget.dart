import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/app/app_color.dart';
import 'package:ecommerce/core/widgets/centered_progress_indicator.dart';
import 'package:ecommerce/features/common/ui/controllers/home_slider_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({super.key});

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  final ValueNotifier<int> _selectedindex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeSliderController>(
      builder: (controller) {
        return Visibility(
          visible: controller.inProgress==false,
          replacement: SizedBox(
            height: 200,
              child: CenteredProgressIndicator()),
          child: Visibility(
            visible: controller.sliderList.isNotEmpty,
            child: Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    viewportFraction: 0.90,
                    onPageChanged: (index, reason) {
                      _selectedindex.value = index;
                    },
                  ),
                  items: controller.sliderList.map((model) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 2.0),
                          decoration: BoxDecoration(
                            //color: AppColors.themeColor,
                            image: DecorationImage(
                              image: NetworkImage(model.photo),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              model.description,
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),

                SizedBox(height: 8),
                ValueListenableBuilder(
                  valueListenable: _selectedindex,
                  builder: (context, value, _) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < controller.sliderList.length; i++)
                          Container(
                            height: 16,
                            width: 16,
                            margin: EdgeInsets.symmetric(horizontal: 2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: BoxBorder.all(color: Colors.grey.shade300),
                              color: _selectedindex.value == i
                                  ? AppColors.themeColor
                                  : null,
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
