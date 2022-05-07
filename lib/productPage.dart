import 'package:flutter/material.dart';
import 'package:untitled/pages/drawer_menu.dart';
import 'package:untitled/pages/footer.dart';
import 'package:untitled/pages/header.dart';
import 'package:untitled/pages/home_slider.dart';
import 'package:untitled/product_detail_page.dart';
import 'package:untitled/utils/CustomTextStyle.dart';
import 'package:untitled/utils/MenuItem.dart';
import 'package:untitled/utils/ResponsiveLayout.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  GlobalKey<ScaffoldState> keyScaffold = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return createScaffold(context);
  }

  createScaffold(context) {
    return Scaffold(
      key: keyScaffold,
      endDrawer: ResponsiveLayout.isSmallScreen(context)
          ? DrawerMenu(MenuItem.MENU_PRODUCTLIST)
          : null,
      body: Builder(builder: (context) {
        return Column(
          children: [
            Header(MenuItem.MENU_PRODUCTLIST, context),
            Expanded(
              child: ListView(
                children: <Widget>[
                  HomeSlider(context),
                  gridProductSection(context),
                  Footer()
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  gridProductSection(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Column(
        children: <Widget>[
          Text(
            "商品清單",
            style: CustomTextStyle.boldTextStyle
                .copyWith(color: Colors.black, fontSize: 34),
          ),
          Container(
            height: 2,
            width: 100,
            color: Colors.black,
            margin: EdgeInsets.only(top: 8),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            children: <Widget>[
              Spacer(
                flex: 10,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: getGridCount(context),
                      childAspectRatio: 1.3),
                  itemBuilder: (context, position) {
                    return gridProductItem();
                  },
                  itemCount: 8,
                  shrinkWrap: true,
                  primary: false,
                ),
                flex: 80,
              ),
              Spacer(
                flex: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }

  getGridCount(context) {
    if (ResponsiveLayout.isSmallScreen(context)) {
      return 1;
    } else if (ResponsiveLayout.isMediumScreen(context)) {
      return 2;
    } else {
      return 3;
    }
  }

  gridProductItem() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductDetailPage(
                  parentContext: context,
                )));
      },
      child: Container(
        margin: EdgeInsets.all(4),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image(
                  image: AssetImage("banner1.jpg"),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    color: Colors.black,
                    margin: EdgeInsets.only(top: 8),
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Text(
                      "Sale",
                      style: CustomTextStyle.regularTextStyle
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    "Brown ballerians",
                    style: CustomTextStyle.boldTextStyle,
                  ),
                  margin: EdgeInsets.only(left: 8),
                ),
                Container(
                  child: Text("\$ 52", style: CustomTextStyle.regularTextStyle),
                  margin: EdgeInsets.only(right: 8),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "Join Life",
                style: CustomTextStyle.regularTextStyle
                    .copyWith(color: Colors.grey, fontSize: 14),
              ),
              margin: EdgeInsets.only(left: 8),
            ),
          ],
        ),
      ),
    );
  }
}
