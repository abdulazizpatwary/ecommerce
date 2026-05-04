import 'package:ecommerce/app/app_color.dart';
import 'package:ecommerce/features/common/data/models/product_model.dart';
import 'package:ecommerce/features/common/ui/widgets/favourite_custom_button.dart';
import 'package:ecommerce/features/product/ui/screens/product_details_screen.dart';
import 'package:flutter/material.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({
    super.key,
    required this.model,
    required this.icon,
    required this.onTapFavourite,
  });

  final ProductModel model;
  final IconData icon;
  final VoidCallback onTapFavourite;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductDetailsScreen.name,
          arguments: model.id,
        );
      },
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(horizontal: 8),


        child: SizedBox(
          width: 140,
          child: Column(
            children: [
              Container(
                height: 100,
                width: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    topLeft: Radius.circular(8),
                  ),
                  color: AppColors.themeColor.withValues(alpha: 0.15),
                  image: model.photos.isNotEmpty
                      ? DecorationImage(
                          image: NetworkImage(model.photos.first),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: model.photos.isEmpty
                    ? Icon(Icons.broken_image)
                    : null,
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(

                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: 2),
                    FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '\$${model.currentPrice}',
                            style: TextStyle(
                              color: AppColors.themeColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 3,),
                          Wrap(
                            children: [
                              Icon(Icons.star, color: Colors.amber, size: 18),
                              Text(
                                model.rating,
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SizedBox(width: 3,),
                          FavouriteCustomButton(
                            productId: model.id,
                            icon: icon,
                            onTap: onTapFavourite,
                          ),
                          SizedBox(width: 4,)
                        ],
                      ),
                    ),

                    SizedBox(height: 4),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
