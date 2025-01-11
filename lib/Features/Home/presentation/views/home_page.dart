import 'package:flutter/material.dart';
import 'package:soo2_3edda/Features/Home/presentation/views/widgets/Custom%20Bottom%20Navigation%20Bar/custom_bottom_navigation_bar.dart';
import 'package:soo2_3edda/Features/Home/presentation/views/widgets/custom_body_home_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;

  void _onIconPressed(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

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
      body: CustomBodyHomePage(
        scaffoldKey: scaffoldKey,
        selectedIndex: _currentIndex,
      ),
      bottomNavigationBar:
          //  BottomNavigationBar(
          //   items: const [
          //     BottomNavigationBarItem(icon: Icon(Icons.home)),
          //     BottomNavigationBarItem(icon: Icon(Icons.search)),
          //     BottomNavigationBarItem(icon: Icon(Icons.card_travel)),
          //     BottomNavigationBarItem(icon: Icon(Icons.favorite)),
          //   ],
          // )
          CustomBottomNavigationBar(
        onIconPresedCallback: _onIconPressed,
      ),
    );
  }
}
