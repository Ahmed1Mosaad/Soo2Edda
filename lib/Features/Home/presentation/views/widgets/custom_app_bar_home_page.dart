import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:soo2_3edda/Features/Home/presentation/views/widgets/icon_menu_button.dart';


class CustomAppBarHomePage extends StatelessWidget {
  const CustomAppBarHomePage({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: [
          IconMenuButton(onTap: () async {
            final player = AudioPlayer();
            await player
                .play(AssetSource('sounds/timkahn__tangel.wav'));
            scaffoldKey.currentState!.openDrawer();
          }),
          const Spacer(),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                image:const DecorationImage(
                    image: AssetImage(
                        'assets/images/Elon_Musk_Royal_Society_crop.jpg',),fit: BoxFit.cover),
                color: Colors.red,
                borderRadius: BorderRadius.circular(12)),
          )
        ],
      ),
    );
  }
}

// await FirebaseAuth.instance.signOut();
// GoRouter.of(context).pop();
// showCustomMaterialBanner(
//     context: context,
//     title: 'Logged Out Successfully',
//     message: "You have been logged out. See you next time!");


