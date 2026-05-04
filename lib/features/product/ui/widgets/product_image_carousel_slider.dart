import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/app/app_color.dart';
import 'package:ecommerce/features/common/data/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductImageCarouselSlider extends StatefulWidget {
  const ProductImageCarouselSlider({super.key, required this.model});
  final ProductModel model;

  @override
  State<ProductImageCarouselSlider> createState() => _ProductImageCarouselSliderState();
}

class _ProductImageCarouselSliderState extends State<ProductImageCarouselSlider> {
  final ValueNotifier<int> _selectedindex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            height: 220.0,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              _selectedindex.value = index;
            },
          ),
          items: widget.model.photos.map((image) {
            return Builder(
              builder: (BuildContext context) {
                return Image.network(image,fit: BoxFit.cover,);
              },
            );
          }).toList(),
        ),
        SizedBox(height: 8,),
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: ValueListenableBuilder(
            valueListenable: _selectedindex,
            builder: (context, value, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < widget.model.photos.length; i++)
                    Container(
                      height: 16,
                      width: 16,
                      margin: EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: BoxBorder.all(color: Colors.grey.shade300),
                        color: _selectedindex.value == i
                            ? AppColors.themeColor
                            : Colors.white,
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
