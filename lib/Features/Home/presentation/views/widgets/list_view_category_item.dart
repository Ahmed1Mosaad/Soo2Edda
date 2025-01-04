import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:soo2_3edda/Features/Home/presentation/views/widgets/category_item.dart';
import 'package:soo2_3edda/core/constants.dart';

class ListViewCategoryItem extends StatefulWidget {
   ListViewCategoryItem({super.key, required this.selectedItem});
   int selectedItem ;
  @override
  State<ListViewCategoryItem> createState() => _ListViewCategoryItemState();
}

class _ListViewCategoryItemState extends State<ListViewCategoryItem> {
  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
                height: 55,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CategoryItem(
                      onTap: () {
                        final player = AudioPlayer();
                        player.play(AssetSource('sounds/timkahn__tangel.wav'));
                        setState(() {
                          widget.selectedItem = 0;
                        });
                      },
                      titleCategory: 'Sneakers   ',
                      image: const AssetImage('assets/images/shoes.png'),
                      width: widget.selectedItem == 0 ? 2 : 1,
                      borderColor:
                          widget.selectedItem == 0 ?orange : grey,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    CategoryItem(
                      onTap: () {
                        final player = AudioPlayer();
                        player.play(AssetSource('sounds/timkahn__tangel.wav'));
                        setState(() {
                          widget.selectedItem = 1;
                        });
                      },
                      titleCategory: 'Watch   ',
                      image: const AssetImage('assets/images/watch.png'),
                      width: widget.selectedItem == 1 ? 2 : 1,
                      borderColor:
                          widget.selectedItem == 1 ?orange : grey,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    CategoryItem(
                      onTap: () {
                        final player = AudioPlayer();
                        player.play(AssetSource('sounds/timkahn__tangel.wav'));
                        setState(() {
                          widget.selectedItem = 2;
                        });
                      },
                      titleCategory: 'T-Shirt   ',
                      image: const AssetImage('assets/images/T-shirt.png'),
                      width: widget.selectedItem == 2 ? 2 : 1,
                      borderColor:
                          widget.selectedItem == 2 ?orange : grey,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    CategoryItem(
                      onTap: () {
                        final player = AudioPlayer();
                        player.play(AssetSource('sounds/timkahn__tangel.wav'));
                        setState(() {
                          widget.selectedItem = 3;
                        });
                      },
                      titleCategory: 'Jacket  ',
                      image: const AssetImage('assets/images/jacket.png'),
                      width: widget.selectedItem == 3 ? 2 : 1,
                      borderColor:
                          widget.selectedItem == 3 ?orange : grey,
                    ),
                  ],
                ),
              );
  }
}