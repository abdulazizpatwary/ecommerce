import 'package:ecommerce/features/review/data/review_item_model.dart';
import 'package:flutter/material.dart';

class ReviewCardItem extends StatelessWidget {
  const ReviewCardItem({
    super.key, required this.model,
  });
  final ReviewItemModel model;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey.withValues(alpha: 0.20),
              foregroundColor: Colors.black45,
              radius:16,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Icon(Icons.person_2_outlined),
              ),),
            SizedBox(width: 8,),
            Text(model.user.fullName,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.grey.shade800),)
          ],
        ),
        subtitle: Text(model.comment,style: TextStyle(color: Colors.grey),),
      ),
    );
  }
}