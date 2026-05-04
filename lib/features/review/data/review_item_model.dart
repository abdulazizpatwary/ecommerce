import 'package:ecommerce/features/review/data/review_user_model.dart';

class ReviewItemModel {
  final String id;
  final ReviewUserModel user;
  final int rating;
  final String comment;

  ReviewItemModel({
    required this.id,
    required this.user,
    required this.rating,
    required this.comment,
  });

  factory ReviewItemModel.fromJson(Map<String, dynamic> jsonData) {
    return ReviewItemModel(
      id: jsonData['_id'],
      user: ReviewUserModel.fromJson(jsonData['user']),
      rating: jsonData['rating'],
      comment: jsonData['comment'],
    );
  }
}
