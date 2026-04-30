import 'package:ecommerce/app/app_color.dart';
import 'package:flutter/material.dart';

class ProductIncDecWidget extends StatefulWidget {
  const ProductIncDecWidget({super.key, required this.onChange});
  final Function(int) onChange;

  @override
  State<ProductIncDecWidget> createState() => _ProductIncDecWidgetState();
}

class _ProductIncDecWidgetState extends State<ProductIncDecWidget> {
  int _count=1;
  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          _incDecButton(icon: Icons.remove, onTap: () {
            if(_count<=1)return;
            _count--;
            widget.onChange(_count);
            setState(() {});
          }),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('$_count',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
          ),
          _incDecButton(icon: Icons.add, onTap: () {
            if(_count>=20)return;
            _count++;
            widget.onChange(_count);
            setState(() {
            });
          }),
        ],
      );

  }

  Widget _incDecButton({required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppColors.themeColor,
              borderRadius: BorderRadius.circular(4),
            ),
        child: Icon(icon,color: Colors.white,),),
    );
  }
}
