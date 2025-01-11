import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:soo2_3edda/Features/Home/presentation/manager/Heart%20Provider/heart_provider.dart';
import 'package:soo2_3edda/core/constants.dart';


class CustomAppBarProductDetailsPage extends StatelessWidget {
  final int id;
  const CustomAppBarProductDetailsPage({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    var isLiked = Provider.of<HeartProvider>(context).isSelected[id] ?? false;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new),
            iconSize: 16,
            color: grey,
            padding: const EdgeInsets.only(left: 3),
            style: IconButton.styleFrom(
                fixedSize: const Size(43, 43),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                side: BorderSide(color: grey.withOpacity(.5), width: 1.5)),
          ),
          IconButton(
            onPressed: () {
              Provider.of<HeartProvider>(context, listen: false).toggle(id: id);
      
              print(isLiked);
            },
            icon: Icon(isLiked ? Icons.favorite : Icons.favorite_border),
            iconSize: 17,
            color: isLiked ? Colors.red : grey.withOpacity(.6),
            style: IconButton.styleFrom(
                backgroundColor: white,
                fixedSize: const Size(43, 43),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                side: BorderSide(
                    color:
                        const Color.fromARGB(31, 119, 118, 118).withOpacity(.1),
                    width: 1.5)),
          ),
        ],
      ),
    );
  }
}
