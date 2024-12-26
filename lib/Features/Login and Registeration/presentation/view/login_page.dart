import 'package:flutter/material.dart';
import 'package:soo2_3edda/Features/Login%20and%20Registeration/presentation/view/register_page.dart';
import 'package:soo2_3edda/Features/Login%20and%20Registeration/presentation/view/widgets/custom_text_button.dart';
import 'package:soo2_3edda/Features/Login%20and%20Registeration/presentation/view/widgets/custom_text_form_field.dart';
import 'package:soo2_3edda/Features/Login%20and%20Registeration/presentation/view/widgets/gredient_text.dart';
import 'package:soo2_3edda/core/constants.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        mode = AutovalidateMode.always;
                      });
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
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => RegisterPage()));
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
