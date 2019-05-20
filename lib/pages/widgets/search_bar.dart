import 'package:flutter/material.dart';
import 'package:okapia_app/pages/colors.dart';
import 'package:okapia_app/themes/icons.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmitted;
  final String hintText;
  final bool autoFocus;
  final EdgeInsetsGeometry margin;

  SearchBar({
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.hintText = "",
    this.autoFocus = false,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.0,
      margin: margin,
      child: TextField(
        style: TextStyle(color: PageColors.white, fontSize: 16.0),
        decoration: InputDecoration(
          prefixIcon: Icon(
            AliIcon.search,
            color: PageColors.white,
            size: 22.0,
          ),
          filled: true,
          fillColor: PageColors.orange2,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: PageColors.orange2),
            borderRadius: BorderRadius.circular(40.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: PageColors.orange2),
            borderRadius: BorderRadius.circular(40.0),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 0.0),
          hintText: hintText,
          hintStyle: TextStyle(color: PageColors.white),
          border: InputBorder.none,
        ),
        cursorColor: PageColors.white,
        autofocus: autoFocus,
        controller: controller,
        textInputAction: TextInputAction.search,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
      ),
    );
  }
}
