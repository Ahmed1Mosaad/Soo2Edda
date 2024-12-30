import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

void customShowSnackBarFailure(
    {required BuildContext context,
     ContentType? contentType,
    required String title,
    required String message}) {
  final snackBar = SnackBar(
    /// need to set following properties for best effect of awesome_snackbar_content
    elevation: 0,

    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      color: contentType == ContentType.failure ? const Color.fromARGB(255, 236, 136, 129):null,
      title: title,
      message: message,
      contentType: contentType ?? ContentType.help,
    ),
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}
