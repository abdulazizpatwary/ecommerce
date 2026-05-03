import 'package:ecommerce/app/app_color.dart';
import 'package:ecommerce/features/common/data/models/product_model.dart';
import 'package:ecommerce/features/product/ui/screens/product_details_screen.dart';
import 'package:flutter/material.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({
    super.key, required this.model,
  });
  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductDetailsScreen.name,arguments: 1);
      },
      child: SizedBox(
        width: 140,
        child: Card(
          color: Colors.white,
          margin: EdgeInsets.symmetric(horizontal: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),

          child: Column(
            children: [
              Container(
                height: 120,
                width: 140,
                padding:EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    topLeft: Radius.circular(16),
                  ),
                  color: AppColors.themeColor.withValues(alpha: 0.12),
                  image: model.photos.isNotEmpty?DecorationImage(image: NetworkImage(model.photos.first,),fit: BoxFit.cover):null,
                ),
                child: model.photos.isEmpty?Center(child: Icon(Icons.broken_image)):null,
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                     model.title,
                      maxLines: 1,
                      style: TextStyle(overflow: TextOverflow.ellipsis,fontWeight: FontWeight.w600,color: Colors.black54),
                    ),
                    SizedBox(height: 2,),
                    FittedBox(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FittedBox(child: Text('\$${model.currentPrice}',style: TextStyle(color: AppColors.themeColor,fontWeight: FontWeight.w600),)),
                            Wrap(
                              children: [
                                Icon(Icons.star, color: Colors.amber, size: 18),
                                Text(model.rating,style: TextStyle(fontWeight: FontWeight.w600),),
                              ],
                            ),
                            Container(
                        
                        
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: AppColors.themeColor,
                              ),
                              padding: EdgeInsets.all(4),
                              child: Icon(
                                Icons.favorite_border_outlined,
                                color: Colors.white,
                                size: 14,
                              ),
                            ),
                          ],
                        ),
                    ),

                    SizedBox(height: 4,),
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