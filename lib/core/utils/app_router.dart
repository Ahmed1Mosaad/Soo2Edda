import 'package:go_router/go_router.dart';
import 'package:soo2_3edda/Features/Home/presentation/views/home_page.dart';
import 'package:soo2_3edda/Features/Home/presentation/views/product_details_page.dart';
import 'package:soo2_3edda/Features/Login%20and%20Registeration/presentation/view/login_page.dart';
import 'package:soo2_3edda/Features/Login%20and%20Registeration/presentation/view/register_page.dart';
import 'package:soo2_3edda/Features/splash%20screen/presentation/views/splash_screen.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: '/LoginPage',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/RegisterPage',
        builder: (context, state) => RegisterPage(),
      ),
      GoRoute(
        // path: '/',
        path: '/HomePage',
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
          path: '/ProductDetailsPage',
          // path: '/',
          builder: (context, state) => const ProductDetailsPage())
    ],
  );
}
