import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key, required this.title, required this.onTapBack,
  });
  final String title;
  final VoidCallback onTapBack;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: false,

      title: Row(children: [
        GestureDetector(
          onTap: onTapBack,
            child: Icon(Icons.arrow_back_ios)),
        SizedBox(width: 4,),
        Text(title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black87,letterSpacing: 1),),


      ],),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
