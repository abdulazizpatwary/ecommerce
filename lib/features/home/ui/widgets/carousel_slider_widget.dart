import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/app/app_color.dart';
import 'package:flutter/material.dart';

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({super.key});

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  final ValueNotifier<int> _selectedindex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 180.0,
            viewportFraction: 0.95,
            onPageChanged: (index, reason) {
              _selectedindex.value = index;
            },
          ),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 2.0),
                  decoration: BoxDecoration(color: AppColors.themeColor),
                  child: Center(
                    child: Text('text $i', style: TextStyle(fontSize: 16.0)),
                  ),
                );
              },
            );
          }).toList(),
        ),
        SizedBox(height: 8,),
        ValueListenableBuilder(
          valueListenable: _selectedindex,
          builder: (context, value, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 5; i++)
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
    );
  }
}
