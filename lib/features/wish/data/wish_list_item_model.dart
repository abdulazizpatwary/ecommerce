import 'package:ecommerce/features/common/data/models/product_model.dart';

class WishListItemModel {
  final String id;
  final ProductModel productModel;

  WishListItemModel({required this.id, required this.productModel});
  factory WishListItemModel.fromJson(Map<String,dynamic>jsonData){
    return WishListItemModel(id: jsonData['_id'], productModel: ProductModel.fromJson(jsonData['product']));
  }
}
