import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:soo2_3edda/Features/Home/presentation/manager/Heart%20Provider/heart_provider.dart';
import 'package:soo2_3edda/core/utils/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(ChangeNotifierProvider(
      create: (context) => HeartProvider(), child: const Soo23Edda()));
}

class Soo23Edda extends StatelessWidget {
  const Soo23Edda({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              systemOverlayStyle:
                  SystemUiOverlayStyle(statusBarColor: Colors.grey[400]))),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
