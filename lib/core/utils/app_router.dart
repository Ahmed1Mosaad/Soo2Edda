import 'package:go_router/go_router.dart';
import 'package:soo2_3edda/Features/Home/presentation/views/home_page.dart';
import 'package:soo2_3edda/Features/Login%20and%20Registeration/presentation/view/register_page.dart';

abstract class AppRouter {
  static final router = GoRouter(
  routes: [
    // GoRoute(
    //   path: '/',
    //   builder: (context, state) => LoginPage(),
    // ),
    GoRoute(
      path: '/RegisterPage',
      builder: (context, state) => RegisterPage(),
    ),
    GoRoute(
      path: '/',
      // path: '/HomePage',
      builder: (context, state) => HomePage(),
    ),
  ],
);
}
