import 'package:flutter/material.dart';
import 'package:soo2_3edda/Features/Home/presentation/views/widgets/custom_app_bar_home_page.dart';
import 'package:soo2_3edda/Features/Home/presentation/views/widgets/custom_search_field.dart';
import 'package:soo2_3edda/Features/Home/presentation/views/widgets/icon_filtering_button.dart';
import 'package:soo2_3edda/Features/Home/presentation/views/widgets/icon_heart.dart';
import 'package:soo2_3edda/Features/Home/presentation/views/widgets/list_view_category_item.dart';
import 'package:soo2_3edda/Features/Home/presentation/views/widgets/title_text_name.dart';
import 'package:soo2_3edda/core/constants.dart';

class CustomBodyHomePage extends StatefulWidget {
  const CustomBodyHomePage({
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
            ListViewCategoryItem(
              selectedItem: 0,
            ),
           SizedBox(height:MediaQuery.of(context).size.height * .04 ,),
            Container(
              width: MediaQuery.of(context).size.width * .53,
              height: MediaQuery.of(context).size.height * .35,
              child: const Card(
                color: white,
                child: Column(
                  children: [
                    IconHeart(),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: CircleAvatar(
                            radius: 47,
                            backgroundColor: Color(0xFFfce5dd),
                          ),
                        ),
                        Positioned(
                          bottom: -37,
                          left: 20,
                          child: Image(
                            image: AssetImage('assets/images/shooe_tilt.png'),
                            width: 170,
                            height: 170,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Nike Air Max 200',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                    ),
                    Text(
                      'Trending Now',
                      style: TextStyle(
                          fontSize: 16,
                          color: orange,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      '240.0',
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
