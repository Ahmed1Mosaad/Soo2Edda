import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:soo2_3edda/core/helper/show_custom_material_banner_successful.dart';
import 'package:soo2_3edda/core/helper/show_custom_snack_bar_failure.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'Home Page',
              style: TextStyle(fontSize: 50),
            ),
          ),
          TextButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              GoRouter.of(context).pop();
              showCustomMaterialBanner(
                  context: context,
                  title: 'Logged Out Successfully',
                  message: "You have been logged out. See you next time!");
            },
            style: TextButton.styleFrom(
                backgroundColor: Colors.amber, fixedSize: Size(300, 50)),
            child: const Text('Sign Out'),
          )
        ],
      ),
    );
  }
}
