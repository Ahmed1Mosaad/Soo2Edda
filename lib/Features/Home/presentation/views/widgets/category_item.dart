import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';


class CategoryItem extends StatefulWidget {
  final double width;
  final Color  borderColor;
  final void Function()? onTap;
  final String titleCategory;
  final ImageProvider<Object> image;
  const CategoryItem({
    super.key,
    required this.titleCategory,
    required this.image, this.onTap, required this.width, required this.borderColor,

  });

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      
      onTap: widget.onTap,
      child: Row(
        children: [
          Container(
            height: 55,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(
                    width:widget.width,
                    color:widget.borderColor,
                  ),
                  bottom: BorderSide(
                    width:widget.width,
                    color:widget.borderColor,
                  ),
                  left: BorderSide(
                    width:widget.width,
                    color:widget.borderColor,
                  ),
                  right: BorderSide(
                    width:widget.width,
                    color:widget.borderColor,
                  ),
                ),
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                Image(
                  width: 40,
                  height: 40,
                  image: widget.image,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  widget.titleCategory,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
