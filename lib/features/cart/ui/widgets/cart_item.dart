import 'package:ecommerce/app/app_color.dart';
import 'package:ecommerce/app/assets_path.dart';
import 'package:ecommerce/features/common/ui/widgets/product_inc_dec_widget.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    final theme  = Theme.of(context).textTheme;
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16,vertical: 4),
      elevation: 1,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 14),
        child: Row(
          children: [
            Image.asset(AssetsPath.cartShoePng,height: 90,width: 90,fit: BoxFit.scaleDown,),
            SizedBox(width: 16,),
            Expanded(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment:CrossAxisAlignment.start,
                          children: [
                            Text('New Year Special Shoe',maxLines:1,style: theme.bodyLarge?.copyWith(overflow: TextOverflow.ellipsis),),
                            Row(
                              children: [
                                Text('Color: Red'),
                                SizedBox(width: 8,),
                                Text('Size: XL'),
                              ],
                            )
                          ],
                        ),
                      ),
                      IconButton(onPressed: (){}, icon: Icon(Icons.delete))
                    ],),
                  SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$1000',style: TextStyle(
                          color: AppColors.themeColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600
                      ),),
                      ProductIncDecWidget(onChange: (int count){})
                    ],)

                ],),
            )


          ],
        ),
      ),
    );
  }
}
