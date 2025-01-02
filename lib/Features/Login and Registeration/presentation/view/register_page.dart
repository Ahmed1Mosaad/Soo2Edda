import 'package:flutter/material.dart';
import 'package:soo2_3edda/Features/Login%20and%20Registeration/presentation/view/widgets/custom_body_register_page.dart';
import 'package:soo2_3edda/core/constants.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backGroundWhiteColor,
        appBar: AppBar(
          backgroundColor: backGroundWhiteColor,
          elevation: 0.0,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.close,
                size: 28,
              )),
        ),
        body: const CustomBodyRegisterPage());
  }
}
