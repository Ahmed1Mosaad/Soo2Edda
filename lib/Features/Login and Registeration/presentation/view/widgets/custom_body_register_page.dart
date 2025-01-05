import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:soo2_3edda/Features/Login%20and%20Registeration/data/repo/Auth/auth_repo_implementation.dart';
import 'package:soo2_3edda/Features/Login%20and%20Registeration/presentation/view/widgets/custom_name_text_field.dart';
import 'package:soo2_3edda/Features/Login%20and%20Registeration/presentation/view/widgets/custom_text_button.dart';
import 'package:soo2_3edda/Features/Login%20and%20Registeration/presentation/view/widgets/custom_text_form_field.dart';
import 'package:soo2_3edda/Features/Login%20and%20Registeration/presentation/view/widgets/custom_title_app_name.dart';
import 'package:soo2_3edda/core/helper/show_custom_material_banner_successful.dart';
import 'package:soo2_3edda/core/helper/show_custom_snack_bar_failure.dart';
import 'package:soo2_3edda/core/Errors/check_internet_connection.dart';

class CustomBodyRegisterPage extends StatefulWidget {
  const CustomBodyRegisterPage({super.key});

  @override
  State<CustomBodyRegisterPage> createState() => _CustomBodyRegisterPageState();
}

class _CustomBodyRegisterPageState extends State<CustomBodyRegisterPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode mode = AutovalidateMode.disabled;
  String? email;
  String? password;
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
              Row(
                children: [
                  Expanded(
                    flex: 11,
                    child: CustomNameTextField(
                      hintText: 'First Name',
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'please enter your first name';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 11,
                    child: CustomNameTextField(
                      hintText: 'Last Name',
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'please enter your last name';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 18,
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
                height: 15,
              ),
              CustomTextButton(
                text: 'Sign Up',
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    setState(() {
                      mode = AutovalidateMode.always;
                    });
                  } else {
                    return;
                  }
                  if (await hasInternetConnection()) {
                    customShowSnackBarFailure(
                        contentType: ContentType.failure,
                        context: context,
                        title: 'No Internet Connection',
                        message:
                            'Unable to connect. Please check your network settings');
                    return;
                  }
                  try {
                    await AuthRepoImplementation().createUserrWithEmailPassword(
                        email: email!.trim(), password: password!);
                    showCustomMaterialBanner(
                        context: context,
                        title: 'Congratulations!',
                        message:
                            'Your account has been created successfully. Start exploring!');
                    GoRouter.of(context).push('/HomePage');
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      customShowSnackBarFailure(
                          context: context,
                          title: 'Weak Password!',
                          message:
                              'Your password is too weak. Please use at least 8 characters with letters, numbers, and symbols.',
                          contentType: ContentType.failure);
                    } else if (e.code == 'email-already-in-use') {
                      customShowSnackBarFailure(
                          context: context,
                          contentType: ContentType.help,
                          title: 'Email Already in Use',
                          message:
                              'The email address is already registered. Please use a different email.');
                    } else {
                      customShowSnackBarFailure(
                        context: context,
                        title: 'Registration Error',
                        message:
                            'An unexpected error occurred. Please try again later.',
                        contentType: ContentType.failure,
                      );
                      print('FirebaseAuthException: ${e.message}');
                    }
                  } catch (e) {
                    print(e);
                  }
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * .2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(fontSize: 16, color: Color(0xFF656565)),
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                        shape: const RoundedRectangleBorder(),
                      ),
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                      child: const Text(
                        'Sign In',
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
