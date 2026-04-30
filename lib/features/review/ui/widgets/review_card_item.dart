import 'package:flutter/material.dart';

class ReviewCardItem extends StatelessWidget {
  const ReviewCardItem({
    super.key,
  });

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
            Text('Rabbil Hasan,',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.grey.shade800),)
          ],
        ),
        subtitle: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',style: TextStyle(color: Colors.grey),),
      ),
    );
  }
}