import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:soo2_3edda/Features/Home/presentation/views/widgets/custom_app_bar_home_page.dart';
import 'package:soo2_3edda/Features/Home/presentation/views/widgets/icon_menu_button.dart';

class CustomBodyHomePage extends StatelessWidget {
  const CustomBodyHomePage({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SafeArea(
        child: Column(
          children: [
            CustomAppBarHomePage(scaffoldKey: scaffoldKey),
          ],
        ),
      ),
    );
  }
}
