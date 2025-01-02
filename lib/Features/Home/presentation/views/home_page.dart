import 'package:flutter/material.dart';
import 'package:soo2_3edda/Features/Home/presentation/views/widgets/custom_body_home_page.dart';


class HomePage extends StatelessWidget {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFfbfbfb),
      //drawer بتاع ال  overlay فى حالة التحكم ب لون ال
      drawerScrimColor: Colors.transparent.withOpacity(.1),
      key: scaffoldKey,
      drawer: const Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Ahmed'),
              accountEmail: Text('Ahmed2026developer@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text("xyz"),
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text("xyz"),
                ),
              ],
            ),
            ListTile(
              title: Text("All Inboxes"),
              leading: Icon(Icons.mail),
            ),
            Divider(
              height: 0.1,
            ),
            ListTile(
              title: Text("Primary"),
              leading: Icon(Icons.inbox),
            ),
            ListTile(
              title: Text("Social"),
              leading: Icon(Icons.people),
            ),
            ListTile(
              title: Text("Promotions"),
              leading: Icon(Icons.local_offer),
            )
          ],
        ),
      ),
      body: CustomBodyHomePage(scaffoldKey: scaffoldKey),
    );
  }
}
