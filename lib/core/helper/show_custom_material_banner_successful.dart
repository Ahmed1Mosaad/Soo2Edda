import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

void showCustomMaterialBanner(
    {required BuildContext context,
    required String title,
    required String message}) {
  final materialBanner = MaterialBanner(
    elevation: 0,
    dividerColor: Colors.transparent,
    backgroundColor: Colors.transparent,
    forceActionsBelow: true,
    content: AwesomeSnackbarContent(
      color:const Color.fromARGB(255, 247, 197, 197),
      title: title,
      titleTextStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: Color.fromARGB(255, 255, 162, 0),
      ),
      messageTextStyle: const TextStyle(
        fontSize: 15,
        color: Colors.white,
      ),
      message: message,
      contentType: ContentType.success,
      inMaterialBanner: true,
    ),
    actions: const [SizedBox.shrink()],
  );

  final overlay = Overlay.of(context);

  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: MediaQuery.of(context).padding.top * 1.6,
      left: 0,
      right: 0,
      child: materialBanner,
    ),
  );

  overlay.insert(overlayEntry);

  Future.delayed(const Duration(seconds: 2), () {
    overlayEntry.remove();
  });
}
