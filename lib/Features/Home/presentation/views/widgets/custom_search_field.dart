import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:soo2_3edda/core/constants.dart';

class CustomSearchField extends StatefulWidget {
  final String hintText;
  CustomSearchField({
    super.key,
    required this.hintText,
  });

  @override
  State<CustomSearchField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomSearchField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          prefixIcon: const Icon(
            FontAwesomeIcons.magnifyingGlass,
            size: 20,
            color: Color(0xFF6e706f),
          ),
          fillColor: lightGrey,
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 13, horizontal: 10),
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
          hintText: widget.hintText,
          hintStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              color: Color(0xFF7f8180),
              fontSize: 14)),
    );
  }
}
