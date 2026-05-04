import 'package:ecommerce/app/app_color.dart';
import 'package:ecommerce/app/assets_path.dart';
import 'package:ecommerce/core/widgets/centered_progress_indicator.dart';
import 'package:ecommerce/core/widgets/scaffold_msg.dart';
import 'package:ecommerce/features/cart/data/models/cart_item_model.dart';
import 'package:ecommerce/features/cart/ui/controllers/cart_list_controller.dart';
import 'package:ecommerce/features/common/ui/widgets/product_inc_dec_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItem extends StatefulWidget {
  const CartItem({
    super.key, required this.cartItemModel,

  });
  final CartItemModel cartItemModel;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    final theme  = Theme.of(context).textTheme;
    return GetBuilder<CartListController>(
      builder: (controller) {
        if(controller.isCartItemRemoving(widget.cartItemModel.id)){
          return SizedBox(height:100,child: CenteredProgressIndicator());
        }
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 16,vertical: 4),
          elevation: 1,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 14),
            child: Row(
              children: [
                Image.network(widget.cartItemModel.productModel.photos.first,height: 90,width: 90,fit: BoxFit.scaleDown,errorBuilder: (_,_,_){
                  return Icon(Icons.broken_image);
                },),
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
                                Text(widget.cartItemModel.productModel.title,maxLines:1,style: theme.bodyLarge?.copyWith(overflow: TextOverflow.ellipsis),),
                                Row(
                                  children: [
                                    Text('Color: ${widget.cartItemModel.color}'),
                                    SizedBox(width: 8,),
                                    Text('Size:  ${widget.cartItemModel.size}'),
                                  ],
                                )
                              ],
                            ),
                          ),
                          IconButton(onPressed: ()async{
                            bool isSuccess=await controller.removeFromCart(widget.cartItemModel.id);
                            if(!isSuccess){
                              if(mounted){
                                snackBarMsg(context: context, msg: controller.removeCartItemErrorMsg!);
                              }

                            }
                          }, icon: Icon(Icons.delete))
                        ],),
                      SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('\$${widget.cartItemModel.productModel.currentPrice}',style: TextStyle(
                              color: AppColors.themeColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600
                          ),),
                          SizedBox(
                            width: 80,
                            child: FittedBox(
                              child: ProductIncDecWidget(onChange: (int count){
                                controller.updateCartItemQuantity(widget.cartItemModel.id, count);
                              }),
                            ),
                          )
                        ],)

                    ],),
                )


              ],
            ),
          ),
        );
      }
    );
  }
}
