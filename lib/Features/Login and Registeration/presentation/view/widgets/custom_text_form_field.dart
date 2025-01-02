import 'package:flutter/material.dart';
import 'package:soo2_3edda/core/constants.dart';

class CustomTextFormField extends StatefulWidget {
  final IconData? icon;
  void Function(String)? onChanged;
  final String hintText;
  String? Function(String?)? validator;
  bool obscureText;
  CustomTextFormField({
    super.key,
    this.validator,
    required this.hintText,
    this.icon,
    this.onChanged,
    required this.obscureText,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      obscureText: widget.obscureText,
      validator: widget.validator,
      decoration: InputDecoration(
          suffixIcon: widget.hintText == 'Password'
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      if (widget.hintText == 'Password') {
                        widget.obscureText = !widget.obscureText;
                      }
                    });
                  },
                  icon: widget.obscureText == false
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                )
              : null,
          fillColor: lightGrey,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 24,
          ),
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
          prefixIcon: widget.icon != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Icon(
                    widget.icon,
                    color: grey,
                    size: 20,
                  ),
                )
              : null,
          hintText: widget.hintText,
          hintStyle: const TextStyle(
              fontWeight: FontWeight.w400, color: grey, fontSize: 16)),
    );
  }
}
