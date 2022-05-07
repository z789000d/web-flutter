import 'package:flutter/material.dart';
import 'package:untitled/pages/drawer_menu.dart';
import 'package:untitled/pages/footer.dart';
import 'package:untitled/pages/header.dart';
import 'package:untitled/pages/home_slider.dart';
import 'package:untitled/utils/CustomTextStyle.dart';
import 'package:untitled/utils/MenuItem.dart';
import 'package:untitled/utils/ResponsiveLayout.dart';

class ProductDetailPage extends StatefulWidget {
  ProductDetailPage({this.parentContext, Key? key}) : super(key: key);
  late var parentContext;

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  GlobalKey<ScaffoldState> keyScaffold = GlobalKey();

  var pageViewIndex = 0;
  double sliderHeaderFontSize = 20;
  List<String> listImage = [];
  List<String> listBannerTitle = [];

  void bannerTitle() {
    listBannerTitle.add("banner1");
    listBannerTitle.add("banner2");
    listBannerTitle.add("banner3");
  }

  void bannerList() {
    listImage.add("banner/banner1.jpg");
    listImage.add("banner/banner2.jpg");
    listImage.add("banner/banner3.jpg");
  }

  @override
  void initState() {
    bannerTitle();
    bannerList();
    setUp(widget.parentContext);
    super.initState();
  }

  setUp(context) {}

  @override
  Widget build(BuildContext context) {
    return createScaffold(context);
  }

  double getSliderHeight() {
    if (ResponsiveLayout.isLargeScreen(context)) {
      return MediaQuery.of(context).size.height;
    } else if (ResponsiveLayout.isMediumScreen(context)) {
      return MediaQuery.of(context).size.height / 1.5;
    } else {
      return MediaQuery.of(context).size.height / 1.2;
    }
  }

  createScaffold(context) {
    return Scaffold(
      key: keyScaffold,
      endDrawer: ResponsiveLayout.isSmallScreen(context)
          ? DrawerMenu(MenuItem.MENU_NO)
          : null,
      body: Builder(builder: (context) {
        return Column(
          children: [
            Header(MenuItem.MENU_NO, context),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  sliderSection(context),
                  productDetailList(),
                  Footer()
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  sliderSection(context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              height: getSliderHeight(),
              child: PageView.builder(
                itemBuilder: (context, position) {
                  pageViewIndex = position;
                  return createSlider(pageViewIndex % listImage.length);
                },
                onPageChanged: (position) {
                  setState(() {});
                },
                itemCount: 999,
              ),
            ),
          ),
          Positioned.fill(
              child: Container(
            alignment: Alignment.bottomCenter,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: indicator(pageViewIndex % listImage.length),
            ),
          ))
        ],
      ),
    );
  }

  List<Widget> indicator(int nowPosition) {
    List<Widget> indicatorList = [];

    for (int i = 0; i < listImage.length; i++) {
      indicatorList.add(Container(
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        decoration: BoxDecoration(
            color: nowPosition == i ? Colors.blue : Colors.grey,
            borderRadius: BorderRadius.circular(1000)),
        child: SizedBox(
          width: 10,
          height: 10,
        ),
      ));
    }

    return indicatorList;
  }

  gridProductItem() {
    return Container(
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
    );
  }

  createSlider(position) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: getSliderHeight(),
            child: Image(
              image: AssetImage(listImage[position]),
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: getSliderHeight(),
            margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  listBannerTitle[position],
                  textAlign: TextAlign.start,
                  style: CustomTextStyle.boldTextStyle
                      .copyWith(fontSize: sliderHeaderFontSize),
                ),
                SizedBox(
                  height: 24,
                ),
              ],
            ),
          )
        ],
      )),
    );
  }

  Widget productDetailList() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              'MIT 撞色連身泳衣',
              style: CustomTextStyle.regularTextStyle
                  .copyWith(color: Colors.black),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              '* 基於衛生考量不換貨',
              style: CustomTextStyle.regularTextStyle12
                  .copyWith(color: Colors.black),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [Icon(Icons.favorite_border), Text(' 加入最愛')],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              '2件8折',
              style: CustomTextStyle.regularTextStyle12
                  .copyWith(color: Colors.red),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Row(children: [
              Text(
                'NT.640',
                style: CustomTextStyle.regularTextStyle12.copyWith(
                  color: Colors.red,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  'NT.800',
                  style: CustomTextStyle.regularTextStyle12.copyWith(
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ),
            ]),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              '規格 黑色',
              style: CustomTextStyle.regularTextStyle14
                  .copyWith(color: Colors.black),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              'Size L',
              style: CustomTextStyle.regularTextStyle14
                  .copyWith(color: Colors.black),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              '數量 1',
              style: CustomTextStyle.regularTextStyle14
                  .copyWith(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
