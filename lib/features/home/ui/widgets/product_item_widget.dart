import 'package:ecommerce/app/app_color.dart';
import 'package:ecommerce/app/assets_path.dart';
import 'package:flutter/material.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),

        child: Column(
          children: [
            Container(
              padding:EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  topLeft: Radius.circular(16),
                ),
                color: AppColors.themeColor.withValues(alpha: 0.12),
              ),
              child: Image.asset(
                AssetsPath.shoePng,
                width: 140,
                height: 80,
                fit: BoxFit.scaleDown,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'New Year special shoe',
                    maxLines: 1,
                    style: TextStyle(overflow: TextOverflow.ellipsis,fontWeight: FontWeight.w600,color: Colors.black54),
                  ),
                  SizedBox(height: 2,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FittedBox(child: Text('\$100',style: TextStyle(color: AppColors.themeColor,fontWeight: FontWeight.w600),)),
                      Wrap(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 18),
                          Text('4.8',style: TextStyle(fontWeight: FontWeight.w600),),
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
                  SizedBox(height: 4,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}