import 'package:flutter/material.dart';

class ProductSearchBar extends StatelessWidget {
  const ProductSearchBar({
    super.key, required this.searchBarController,
  });
  final TextEditingController searchBarController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchBarController,
      decoration: InputDecoration(
        hintText: 'Search',
        prefixIcon: Icon(Icons.search,color: Colors.grey,),
        filled: true,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none
        ),

      ),
    );
  }
}