import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:soo2_3edda/Features/Login%20and%20Registeration/data/repo/Auth/auth_repo_implementation.dart';
import 'package:soo2_3edda/Features/Login%20and%20Registeration/presentation/view/widgets/custom_text_button.dart';
import 'package:soo2_3edda/Features/Login%20and%20Registeration/presentation/view/widgets/custom_text_form_field.dart';
import 'package:soo2_3edda/Features/Login%20and%20Registeration/presentation/view/widgets/custom_title_app_name.dart';
import 'package:soo2_3edda/core/helper/show_custom_material_banner_successful.dart';
import 'package:soo2_3edda/core/helper/show_custom_snack_bar_failure.dart';
import 'package:soo2_3edda/core/Errors/check_internet_connection.dart';

class CustomBodyLoginPage extends StatefulWidget {
  const CustomBodyLoginPage({super.key});

  @override
  State<CustomBodyLoginPage> createState() => _CustomBodyLoginPageState();
}

class _CustomBodyLoginPageState extends State<CustomBodyLoginPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  AutovalidateMode mode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
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
              const CustomeTitleAppName(),
              const SizedBox(
                height: 35,
              ),
              CustomTextFormField(
                onChanged: (String? value) {
                  email = value;
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
                  password = value;
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
                  } else {
                    return;
                  }

                  if (await hasInternetConnection()) {
                    //TODO Mobile network available.
                    customShowSnackBarFailure(
                        contentType: ContentType.failure,
                        context: context,
                        title: 'No Internet Connection',
                        message:
                            'Unable to connect. Please check your network settings');
                    return;
                  }
                  try {
                    AuthRepoImplementation()
                        .signInWithEmailPassword(email!.trim(), password!);
                    showCustomMaterialBanner(
                        context: context,
                        title: 'Welcome Back!',
                        message:
                            "ou’ve successfully signed in. Enjoy exploring the app!");
                    GoRouter.of(context).push('/HomePage');
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      customShowSnackBarFailure(
                          contentType: ContentType.warning,
                          context: context,
                          title: "User Not Found",
                          message:
                              "No account exists with this email address. Please check the email and try again or register for a new account");
                    } else if (e.code == 'wrong-password') {
                      customShowSnackBarFailure(
                          contentType: ContentType.failure,
                          context: context,
                          title: "Wrong Password",
                          message:
                              "The password is incorrect. Please try again");
                    } else if (e.code == 'invalid-credential') {
                      customShowSnackBarFailure(
                          contentType: ContentType.failure,
                          context: context,
                          title: 'Invalid Credential',
                          message:
                              "The credentials provided are invalid. Please check and try again");
                    } else {
                      customShowSnackBarFailure(
                          contentType: ContentType.failure,
                          context: context,
                          title: 'Invalid Credential',
                          message:
                              "The credentials provided are invalid. Please check and try again");
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
    );
  }
}
