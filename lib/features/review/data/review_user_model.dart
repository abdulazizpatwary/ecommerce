class ReviewUserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String? avatarUrl;
   String get fullName{
    return "$firstName $lastName";
}

  ReviewUserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.avatarUrl,
  });

  factory ReviewUserModel.fromJson(Map<String, dynamic> jsonData) {
    return ReviewUserModel(
      id: jsonData['_id'],
      firstName: jsonData['first_name'],
      lastName: jsonData['last_name'],
      avatarUrl: jsonData['avatar_url'],
    );
  }
}
