class CategoryItemModel {
  final String id;
  final String title;
  final String slug;
  final String description;
  final String icon;

  CategoryItemModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.icon,
  });

  factory CategoryItemModel.fromJson(Map<String, dynamic> jsonData) {
    return CategoryItemModel(
      id: jsonData['_id'],
      title: jsonData['title'],
      slug: jsonData['slug'],
      description: jsonData['description'],
      icon: jsonData['icon'],
    );
  }
}
