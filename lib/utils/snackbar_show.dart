
import 'package:flutter/material.dart';

void snackBarShow(String message, BuildContext context){
  ScaffoldMessenger.of(context)
      .showSnackBar(
      SnackBar(
        content: Text("${message}"),
      ));
}