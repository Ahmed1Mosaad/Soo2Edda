import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soo2_3edda/Features/Home/presentation/views/helpers/product_image.dart';
import 'package:soo2_3edda/Features/Home/presentation/views/widgets/custom_app_bar_product_details_page.dart';

class CustomBodyProductDetailsPage extends StatefulWidget {
  const CustomBodyProductDetailsPage({super.key, required this.id});
  final int id;

  @override
  State<CustomBodyProductDetailsPage> createState() =>
      _CustomBodyProductDetailsPageState();
}

class _CustomBodyProductDetailsPageState
    extends State<CustomBodyProductDetailsPage> with TickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: controller!, curve: Curves.easeInToLinear));
    controller!.forward();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  Widget categoryWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0),
      width: MediaQuery.of(context).size.width,
      height: 80,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              AppData.showThumbnailList.map((x) => _thumbnail(x)).toList()),
    );
  }

  Widget _thumbnail(String image) {
    return AnimatedBuilder(
      animation: animation!,
      //  builder: null,
      builder: (context, child) => AnimatedOpacity(
        opacity: animation!.value,
        duration: const Duration(milliseconds: 500),
        child: child,
      ),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(13)),
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            height: 40,
            width: 50,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xffA1A3A6),
              ),
              borderRadius: const BorderRadius.all(Radius.circular(13)),
              // color: Theme.of(context).backgroundColor,
            ),
            child: Image.asset(image),
          ),
        ),
      ),
    );
  }

  Widget _detailWidget() {
    return DraggableScrollableSheet(
      maxChildSize: .8,
      initialChildSize: .53,
      minChildSize: .53,
      builder: (context, scrollController) {
        return Container(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 0),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              color: Colors.white),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                const SizedBox(height: 5),
                Container(
                  alignment: Alignment.center,
                  child: Container(
                    width: 50,
                    height: 5,
                    decoration: const BoxDecoration(
                        color: Color(0xffa8a09b),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      TitleText(text: "NIKE AIR MAX 200", fontSize: 25),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              TitleText(
                                text: "\$ ",
                                fontSize: 18,
                                color: Color(0xffF72804),
                              ),
                              TitleText(
                                text: "240",
                                fontSize: 25,
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(Icons.star,
                                  color: Color(0xfffbba01), size: 17),
                              Icon(Icons.star,
                                  color: Color(0xfffbba01), size: 17),
                              Icon(Icons.star,
                                  color: Color(0xfffbba01), size: 17),
                              Icon(Icons.star,
                                  color: Color(0xfffbba01), size: 17),
                              Icon(Icons.star_border, size: 17),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              const  SizedBox(
                  height: 20,
                ),
                _availableSize(),
               const SizedBox(
                  height: 20,
                ),
                _availableColor(),
              const  SizedBox(
                  height: 20,
                ),
                _description(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _availableSize() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
       const TitleText(
          text: "Available Size",
          fontSize: 14,
        ),
       const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _sizeWidget("US 6"),
            _sizeWidget("US 7", isSelected: true),
            _sizeWidget("US 8"),
            _sizeWidget("US 9"),
          ],
        )
      ],
    );
  }

  Widget _sizeWidget(String text, {bool isSelected = false}) {
    return Container(
      padding:const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
            color:const Color(0xffa8a09b),
            style: !isSelected ? BorderStyle.solid : BorderStyle.none),
        borderRadius:const BorderRadius.all(Radius.circular(13)),
        color: isSelected ?const Color(0xffE65829) :const Color(0XFFFFFFFF),
      ),
      child: InkWell(
        borderRadius:const BorderRadius.all(Radius.circular(13)),
        onTap: () {},
        child: TitleText(
          text: text,
          fontSize: 16,
          color: isSelected ?const Color(0XFFFFFFFF) :const Color(0xff1d2635),
        ),
      ),
    );
  }

  Widget _availableColor() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
       const TitleText(
          text: "Available Size",
          fontSize: 14,
        ),
       const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _colorWidget(Color(0xfffbba01), isSelected: true),
           const SizedBox(
              width: 30,
            ),
            _colorWidget(Color(0xff5F5F60)),
           const SizedBox(
              width: 30,
            ),
            _colorWidget(Color(0xff20262C)),
           const SizedBox(
              width: 30,
            ),
            _colorWidget(Color(0xffF72804)),
           const SizedBox(
              width: 30,
            ),
            _colorWidget(Color(0xff2890c8)),
          ],
        )
      ],
    );
  }

  Widget _colorWidget(Color color, {bool isSelected = false}) {
    return CircleAvatar(
      radius: 12,
      backgroundColor: color.withAlpha(150),
      child: isSelected
          ? Icon(
              Icons.check_circle,
              color: color,
              size: 18,
            )
          : CircleAvatar(radius: 7, backgroundColor: color),
    );
  }

  Widget _description() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
       const TitleText(
          text: "Available Size",
          fontSize: 14,
        ),
       const SizedBox(height: 20),
        Text(AppData.description),
      ],
    );
  }

  FloatingActionButton _flotingButton() {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor:const Color(0xffE65829),
      child: Icon(Icons.shopping_basket,
          color: Theme.of(context).floatingActionButtonTheme.backgroundColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _flotingButton(),
      body: SafeArea(
        child: Container(
          decoration:const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color(0xfffbfbfb),
              Color(0xfff7f7f7),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  CustomAppBarProductDetailsPage(
                    id: widget.id,
                  ),
                  productImage(animation),
                  categoryWidget(),
                ],
              ),
              _detailWidget()
            ],
          ),
        ),
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//       child: Column(
//         children: [
//           CustomAppBarProductDetailsPage(
//             id: widget.id,
//           ),
//         ],
//       ),
//     ));
//   }
// }

class TitleText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  const TitleText(
      {required this.text,
      this.fontSize = 18,
      this.color = const Color.fromARGB(255, 220, 202, 202),
      this.fontWeight = FontWeight.w800});
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.mulish(
            fontSize: fontSize, fontWeight: fontWeight, color: color));
  }
}

class Product {
  final int id;
  final String name;
  final String category;
  final String image;
  final double price;
  final bool isliked;
  final bool isSelected;
  Product(
      {required this.id,
      required this.name,
      required this.category,
      required this.price,
      required this.isliked,
      this.isSelected = false,
      required this.image});
}

class Category {
  final int id;
  final String name;
  final String image;
  final bool isSelected;
  Category({
    required this.id,
    required this.name,
    this.isSelected = false,
    required this.image,
  });
}

class AppData {
  static List<Product> productList = [
    Product(
        id: 1,
        name: 'Nike Air Max 200',
        price: 240.00,
        isSelected: true,
        isliked: false,
        image: 'assets/asset/shooe_tilt_1.png',
        category: "Trending Now"),
    Product(
        id: 2,
        name: 'Nike Air Max 97',
        price: 220.00,
        isliked: false,
        image: 'assets/asset/shoe_tilt_2.png',
        category: "Trending Now"),
  ];
  static List<Product> cartList = [
    Product(
        id: 1,
        name: 'Nike Air Max 200',
        price: 240.00,
        isSelected: true,
        isliked: false,
        image: 'assets/asset/small_tilt_shoe_1.png',
        category: "Trending Now"),
    Product(
        id: 2,
        name: 'Nike Air Max 97',
        price: 190.00,
        isliked: false,
        image: 'assets/asset/small_tilt_shoe_2.png',
        category: "Trending Now"),
    Product(
        id: 1,
        name: 'Nike Air Max 92607',
        price: 220.00,
        isliked: false,
        image: 'assets/asset/small_tilt_shoe_3.png',
        category: "Trending Now"),
    Product(
        id: 2,
        name: 'Nike Air Max 200',
        price: 240.00,
        isSelected: true,
        isliked: false,
        image: 'assets/asset/small_tilt_shoe_1.png',
        category: "Trending Now"),
    // Product(
    //     id:1,
    //     name: 'Nike Air Max 97',
    //     price: 190.00,
    //     isliked: false,
    //     image: 'assets/small_tilt_shoe_2.png',
    //     category: "Trending Now"),
  ];
  static List<Category> categoryList = [
    Category(id: 0, name: '', image: 'assets/images/shooe_tilt.png'),
    Category(
        id: 1,
        name: "Sneakers",
        image: 'assets/asset/shoe_thumb_2.png',
        isSelected: true),
    Category(id: 2, name: "Jacket", image: 'assets/asset/jacket.png'),
    Category(id: 3, name: "Watch", image: 'assets/asset/watch.png'),
    Category(id: 4, name: "Watch", image: 'assets/asset/watch.png'),
  ];
  static List<String> showThumbnailList = [
    "assets/asset/shoe_thumb_5.png",
    "assets/asset/shoe_thumb_1.png",
    "assets/asset/shoe_thumb_4.png",
    "assets/asset/shoe_thumb_3.png",
  ];
  static String description =
      "Clean lines, versatile and timeless—the people shoe returns with the Nike Air Max 90. Featuring the same iconic Waffle sole, stitched overlays and classic TPU accents you come to love, it lets you walk among the pantheon of Air. ßNothing as fly, nothing as comfortable, nothing as proven. The Nike Air Max 90 stays true to its OG running roots with the iconic Waffle sole, stitched overlays and classic TPU details. Classic colours celebrate your fresh look while Max Air cushioning adds comfort to the journey.";
}
