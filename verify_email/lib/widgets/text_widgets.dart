import 'package:flutter/material.dart';

import '../custom_assets/colors.dart';




Widget TextWidget(TextEditingController textEditingController, String hint) {
  return TextField(
    textAlign: TextAlign.center,
    keyboardType: TextInputType.name,
    controller: textEditingController,
    style: TextStyle(color: Colors.white),
    decoration: InputDecoration(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.blue)),
      hintText: hint,
      filled: true,
      fillColor: AppColors.blueColor,
      hintStyle: TextStyle(color: Colors.white),
    ),



  );
}
