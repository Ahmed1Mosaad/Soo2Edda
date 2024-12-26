import 'package:flutter/material.dart';
import 'package:soo2_3edda/core/constants.dart';

class CustomNameTextField extends StatefulWidget {
  final String hintText;
  final String? Function(String?)? validator;
  CustomNameTextField({
    super.key,
    required this.hintText,
    this.validator,
  });

  @override
  State<CustomNameTextField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomNameTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      decoration: InputDecoration(
          fillColor: lightGrey,
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 24, horizontal: 10),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(
                color: lightGrey,
              )),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(
                color: grey,
              )),
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(
                color: Colors.red,
              )),
          focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(
                color: Colors.red,
              )),
          hintText: widget.hintText,
          hintStyle: const TextStyle(
              fontWeight: FontWeight.w400, color: grey, fontSize: 16)),
    );
  }
}
