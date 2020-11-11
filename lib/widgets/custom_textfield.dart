

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:profixapp/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key key,
     this.controller,
        @required this.label, this.value,
        this.labelTextColor,
        this.currentFocusNode,
        this.keyboardType,
        @required this.readOnly,
        this.prefix,
        this.fontSize,
        this.validator,
        this.suffixIcon,
        this.inputFormatters,
        this.nextFocusNode,
        this.labelStyle,
        this.cursorColor = ProfixColor.DARK_BLUE})
      : super(key: key);

  final TextEditingController controller;
  final TextInputType keyboardType;
  final String label;
  final Color labelTextColor;
  final Widget prefix;
  final Widget suffixIcon;
  final List<TextInputFormatter> inputFormatters;
  final FocusNode currentFocusNode;
  final FocusNode nextFocusNode;
  final Color cursorColor;
  final bool readOnly;
  final TextStyle labelStyle;
  final double fontSize;
  final String value;
  final Function(String) validator;

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: readOnly,
      controller: controller,
      keyboardType: keyboardType,
      cursorColor: cursorColor,
      textCapitalization: TextCapitalization.sentences,
      style: TextStyle(color: cursorColor),
      inputFormatters: inputFormatters,
      focusNode: currentFocusNode,
      onEditingComplete: () {
        FocusScope.of(context).requestFocus(nextFocusNode ?? FocusNode());
      },
      onSubmitted: (_) {
        FocusScope.of(context).requestFocus(nextFocusNode ?? FocusNode());
      },
      decoration: InputDecoration(
        prefix: prefix,
        suffixIcon: suffixIcon,
        labelText: label,
        labelStyle: labelStyle ??
            TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: fontSize ?? 14,
              letterSpacing: 0.12,
              color: labelTextColor,
            ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ProfixColor.DARK_BLUE),
        ),
      ),
    );
  }
}