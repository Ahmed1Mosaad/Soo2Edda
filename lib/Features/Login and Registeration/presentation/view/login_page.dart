import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:soo2_3edda/Features/Login%20and%20Registeration/presentation/view/register_page.dart';
import 'package:soo2_3edda/Features/Login%20and%20Registeration/presentation/view/widgets/custom_text_button.dart';
import 'package:soo2_3edda/Features/Login%20and%20Registeration/presentation/view/widgets/custom_text_form_field.dart';
import 'package:soo2_3edda/Features/Login%20and%20Registeration/presentation/view/widgets/gredient_text.dart';
import 'package:soo2_3edda/core/constants.dart';
import 'package:soo2_3edda/core/helper/show_custom_material_banner_successful.dart';
import 'package:soo2_3edda/core/helper/show_custom_snack_bar_failure.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? Email;
  String? Password;
  AutovalidateMode mode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.close,
              size: 28,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: SingleChildScrollView(
          child: Form(
            autovalidateMode: mode,
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .16,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GredientText(
                      text: 'Soo2',
                    ),
                    GredientText(
                      text: 'Edda',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                CustomTextFormField(
                  onChanged: (String? value) {
                    Email = value;
                  },
                  hintText: 'Email',
                  icon: Icons.phone,
                  obscureText: false,
                  validator: (String? value) {
                    String pattern =
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                    RegExp regExp = RegExp(pattern);
                    if (value!.isEmpty) {
                      return 'Please Enter your Email';
                    } else if (!regExp.hasMatch(value)) {
                      return 'please Enter a valid Email';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 18,
                ),
                CustomTextFormField(
                  onChanged: (String? value) {
                    Password = value;
                  },
                  hintText: 'Password',
                  icon: Icons.lock_outline,
                  obscureText: true,
                  validator: (String? value) {
                    String pattern =
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                    RegExp regExp = RegExp(pattern);
                    if (value!.isEmpty) {
                      return 'Please Enter a password';
                    } else if (!regExp.hasMatch(value)) {
                      return 'Please Enter a Strong password';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 13,
                ),
                const Text(
                  'Forget your password?',
                  style: TextStyle(fontSize: 16, color: Color(0xFF656565)),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        mode = AutovalidateMode.always;
                      });
                    }
                    try {
                      final credential = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: Email!.trim(), password: Password!);
                      showCustomMaterialBanner(
                          context: context,
                          title: 'Welcome Back!',
                          message:
                              "ou’ve successfully signed in. Enjoy exploring the app!");
                      GoRouter.of(context).push('/HomePage');
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        customShowSnackBarFailure(
                            context: context,
                            contentType: ContentType.success,
                            title: 'user not found',
                            message: 'No user found for that email.');
                        print('No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Wrong password')));
                        print('Wrong password provided for that user.');
                      }
                    }
                  },
                  text: 'Sign In',
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * .3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(fontSize: 16, color: Color(0xFF656565)),
                    ),
                    TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(),
                        ),
                        onPressed: () {
                          GoRouter.of(context).push('/RegisterPage');
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFbc1f26),
                              fontSize: 16),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
