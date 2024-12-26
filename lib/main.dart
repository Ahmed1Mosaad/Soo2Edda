import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soo2_3edda/Features/Login%20and%20Registeration/presentation/view/login_page.dart';
import 'package:soo2_3edda/Features/Login%20and%20Registeration/presentation/view/register_page.dart';

void main() {
  runApp(Soo23Edda());
}

class Soo23Edda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              systemOverlayStyle:
                  SystemUiOverlayStyle(statusBarColor: Colors.grey[400]))),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
