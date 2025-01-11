import 'package:flutter/material.dart';
import 'package:soo2_3edda/Features/Home/presentation/views/widgets/card_item.dart';
import 'package:soo2_3edda/Features/Home/presentation/views/widgets/custom_app_bar_home_page.dart';
import 'package:soo2_3edda/Features/Home/presentation/views/widgets/custom_search_field.dart';
import 'package:soo2_3edda/Features/Home/presentation/views/widgets/icon_filtering_button.dart';
import 'package:soo2_3edda/Features/Home/presentation/views/widgets/list_view_category_item.dart';
import 'package:soo2_3edda/Features/Home/presentation/views/widgets/title_text_name.dart';

class CustomBodyHomePage extends StatefulWidget {
  List<Widget> screens = const [Text(''), Search(), Cart(), Favorite()];
  int selectedIndex;
  CustomBodyHomePage({
    required this.selectedIndex,
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<CustomBodyHomePage> createState() => _CustomBodyHomePageState();
}

class _CustomBodyHomePageState extends State<CustomBodyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBarHomePage(scaffoldKey: widget.scaffoldKey),
            const TextTitleName(),
            Row(
              children: [
                Expanded(
                    flex: 6,
                    child: CustomSearchField(hintText: 'Search Products')),
                const SizedBox(
                  width: 20,
                ),
                const Expanded(child: IconFilteringButton()),
              ],
            ),
            const SizedBox(
              height: 38,
            ),
            widget.selectedIndex == 0
                ? Column(
                    children: [
                      ListViewCategoryItem(
                        selectedItem: 0,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .04,
                      ),
                      SizedBox(
                        height: 310,
                        width: double.infinity,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              width: 20,
                            );
                          },
                          itemBuilder: (context, index) {
                            return CardItem(
                              image: 'assets/images/shooe_tilt.png',
                              id: index,
                            );
                          },
                        ),
                      ),
                    ],
                  )
                : widget.selectedIndex == 1
                    ? widget.screens[1]
                    : widget.selectedIndex == 2
                        ? widget.screens[2]
                        : widget.selectedIndex == 3
                            ? widget.screens[3]
                            : const Text(''),
          ],
        ),
      ),
    );
  }
}

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Center(
          child: Text(
            'Search',
            style: TextStyle(fontSize: 30),
          ),
        ),
      ],
    );
  }
}

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Center(
          child: Text(
            'Cart',
            style: TextStyle(fontSize: 30),
          ),
        ),
      ],
    );
  }
}

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Center(
          child: Text(
            'Favorite',
            style: TextStyle(fontSize: 30),
          ),
        ),
      ],
    );
  }
}
