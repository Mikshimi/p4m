import 'package:flutter/material.dart';
// ignore: must_be_immutable
class ModifyText extends StatelessWidget {
  String text;
  Color? color;
  double? size;
  bool? weight;
  String? fontFamilyChoice;
  ModifyText({super.key,required this.text,this.size,this.color,this.weight, this.fontFamilyChoice});

  @override
  Widget build(BuildContext context) {
    return  Text(
          text,
      style: TextStyle(
          color:color??Colors.white,
          fontSize:size?? 20,
          fontWeight:weight==null?FontWeight.w400: FontWeight.w500,
          fontFamily:fontFamilyChoice??'Roboto',
      ),);
  }
}