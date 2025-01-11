import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:soo2_3edda/Features/Home/presentation/views/widgets/custom_body_product_details_page.dart';
import 'package:soo2_3edda/core/constants.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final int id = GoRouter.of(context).state!.extra as int;
    return  Scaffold(
      backgroundColor: white,
      body: CustomBodyProductDetailsPage(id: id,),
    );
  }
}
