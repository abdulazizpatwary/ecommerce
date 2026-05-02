import 'package:flutter/material.dart';

void snackBarMsg(
    {required BuildContext context, required String msg, bool isError = false}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(msg, style: TextStyle(color: isError ? Colors.white : null),),
    backgroundColor:isError?Colors.red:null,));
}