import 'package:ecommerce/app/app_color.dart';
import 'package:flutter/material.dart';

class ColorPickerWidget extends StatefulWidget {
  const ColorPickerWidget({
    super.key, required this.colors, required this.onColorChange,
  });
  final List<String>colors;
  final Function(String?)onColorChange;

  @override
  State<ColorPickerWidget> createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {
  String? _selectedColor;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: getColorItems(),),
    );
  }
  List<Widget>getColorItems(){
    List<Widget>colorItemWidgetList=[];
    for(String color in widget.colors){
      Widget item=getColorItemWidget(name: color, onTap: (){
        if(color==_selectedColor){
          _selectedColor=null;
          widget.onColorChange(_selectedColor);
          setState(() {

          });
          return;
        }

        _selectedColor=color;
        widget.onColorChange(_selectedColor!);
        setState(() {

        });

      }, isSelected: _selectedColor==color);
      colorItemWidgetList.add(item);

    }
    return colorItemWidgetList;
  }
  Widget getColorItemWidget( {required String name, required VoidCallback onTap,required bool isSelected}){
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
