class ProductModel {
  final String id;
  final String title;
  final String slug;
  final String description;
  final List<String> photos;
  final List<String> colors;
  final List<String> sizes;
  final int regularPrice;
  final int currentPrice;
  final int quantity;
  final String rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.photos,
    required this.colors,
    required this.sizes,

    required this.currentPrice,
    required this.quantity, required this.rating, required this.regularPrice,
  });
  factory ProductModel.fromJson(Map<String,dynamic>jsonData){
    List<dynamic>colors=jsonData['colors'];
    List<dynamic>sizes=jsonData['sizes'];
    List<dynamic>photos=jsonData['photos'];
    return ProductModel(
        id: jsonData['_id'],
        title: jsonData['title'],
        slug: jsonData['slug'],
        description: jsonData['description'],
        photos: List<String>.from(photos),
        colors: List<String>.from(colors),
        sizes: List<String>.from(sizes),
        currentPrice: jsonData['current_price'],
        quantity: jsonData['quantity'],
        rating: jsonData['rating']??'0.0',
        regularPrice: jsonData['regular_price']??0);
  }
}
