import 'package:ecommerce/app/app_color.dart';
import 'package:flutter/material.dart';

class SizePickerWidget extends StatefulWidget {
  const SizePickerWidget({
    super.key, required this.sizes, required this.onSizeChange,
  });
  final List<String>sizes;
  final Function(String?)onSizeChange;

  @override
  State<SizePickerWidget> createState() => _SizePickerWidgetState();
}

class _SizePickerWidgetState extends State<SizePickerWidget> {
  String? _selectedSize;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: getSizeItems(),),
    );
  }
  List<Widget>getSizeItems(){
    List<Widget>sizeItemWidgets=[];
    for(String size in widget.sizes){
      Widget item=getSizeItemWidget(name: size, onTap: (){
        if(size==_selectedSize){
          _selectedSize=null;
          widget.onSizeChange(_selectedSize);
          setState(() {

          });
          return;
        }
        _selectedSize=size;
        widget.onSizeChange(_selectedSize!);
        setState(() {

        });

      }, isSelected: _selectedSize==size);
      sizeItemWidgets.add(item);

    }
    return sizeItemWidgets;
  }
  Widget getSizeItemWidget( {required String name, required VoidCallback onTap,required bool isSelected}){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          border: Border.all(width: 2),
          borderRadius: BorderRadius.circular(8),
          color: isSelected?AppColors.themeColor:Colors.transparent,
        ),
        alignment:Alignment.center,
        child: Text(name,style: TextStyle(color: isSelected?Colors.white:null),),),
    );
  }
}
