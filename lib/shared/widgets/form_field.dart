import 'package:flutter/material.dart';

class KformField extends StatelessWidget {
  const KformField({
    Key? key,
    this.controller,
    this.keyboardType,
    this.cursorColor,
    this.obscureText = false,
    required this.hintText,
    this.label,
    this.prefixIcon,
    this.fillColor,
    this.filled = true,
    this.border,
    this.padding,
    this.validator,
    this.onChanged,
  }) : super(key: key);

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Color? cursorColor;
  final bool obscureText;
  final String hintText;
  final Widget? label;
  final Widget? prefixIcon;
  final Color? fillColor;
  final bool filled;
  final InputBorder? border;
  final EdgeInsets? padding;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      cursorColor: cursorColor,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: padding,
        hintText: hintText,
        label: label,
        prefixIcon: prefixIcon,
        fillColor: fillColor,
        filled: filled,
        focusedBorder: border ??
            const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
              borderSide: BorderSide(
                color: Colors.black,
              ),
            ),
        enabledBorder: border ??
            const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            ),
      ),
      validator: validator,
    );
  }
}
