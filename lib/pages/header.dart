import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/home.dart';
import 'package:untitled/productPage.dart';

import '../about_us.dart';
import '../cart.dart';
import '../contact_us.dart';
import '../login.dart';
import '../profile.dart';
import '../search.dart';
import '../utils/CustomTextStyle.dart';
import '../utils/MenuItem.dart';
import '../utils/ResponsiveLayout.dart';

class Header extends StatelessWidget {
  double sliderHeight = 500;
  double sliderHeaderFontSize = 60;
  List<String> listImage = [];
  late String _keyMenu;
  List<String> listBannerTitle = [];

  Header(this._keyMenu, BuildContext context, {Key? key}) : super(key: key) {
    setUp(context);
  }

  setUp(context) {
    if (ResponsiveLayout.isLargeScreen(context)) {
      sliderHeight = MediaQuery.of(context).size.height / 2;
      sliderHeaderFontSize = 60;
    } else if (ResponsiveLayout.isMediumScreen(context)) {
      sliderHeight = MediaQuery.of(context).size.height / 2;
      sliderHeaderFontSize = 30;
    } else {
      sliderHeight = MediaQuery.of(context).size.height / 2;
      sliderHeaderFontSize = 20;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 8, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: const Image(
                    image: AssetImage("home_icon.jpg"),
                    height: 40,
                    width: 40,
                  ),
                  margin: EdgeInsets.only(left: 24),
                ),
                GestureDetector(
                  onTap: () {
                    if (_keyMenu != MenuItem.MENU_HOME) {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Home()));
                    }
                  },
                  child: Container(
                    child: Text(
                      "Cloud Sis",
                      style: CustomTextStyle.boldTextStyle
                          .copyWith(color: Colors.black, fontSize: 24),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: createMenu(context))
        ],
      ),
    );
  }

  createMenu(context) {
    if (ResponsiveLayout.isMediumScreen(context) ||
        ResponsiveLayout.isLargeScreen(context)) {
      return Container(
        height: 55.0,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width > 860
                  ? MediaQuery.of(context).size.width - 850
                  : 1,
              height: 0,
            ),
            GestureDetector(
              onTap: () {
                if (_keyMenu != MenuItem.MENU_HOME) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Home()));
                }
              },
              child: Container(
                child: Text(
                  "首頁",
                  style: CustomTextStyle.regularTextStyle
                      .copyWith(color: Colors.black, fontSize: 14),
                ),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (_keyMenu != MenuItem.MENU_SEARCH) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Search()));
                }
              },
              child: Container(
                child: Text(
                  "搜尋",
                  style: CustomTextStyle.regularTextStyle
                      .copyWith(color: Colors.black, fontSize: 14),
                ),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (_keyMenu != MenuItem.MENU_PRODUCTLIST) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ProductPage()));
                }
              },
              child: Container(
                child: Text(
                  "商品清單",
                  style: CustomTextStyle.regularTextStyle
                      .copyWith(color: Colors.black, fontSize: 14),
                ),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (_keyMenu != MenuItem.MENU_CART) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Cart()));
                }
              },
              child: Container(
                child: Text(
                  "購物車",
                  style: CustomTextStyle.regularTextStyle
                      .copyWith(color: Colors.black, fontSize: 14),
                ),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (_keyMenu != MenuItem.MENU_PROFILE) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Profile()));
                }
              },
              child: Container(
                child: Text(
                  "個人資料",
                  style: CustomTextStyle.regularTextStyle
                      .copyWith(color: Colors.black, fontSize: 14),
                ),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (_keyMenu != MenuItem.MENU_ABOUT) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => AboutUs()));
                }
              },
              child: Container(
                child: Text(
                  "關於我們",
                  style: CustomTextStyle.regularTextStyle
                      .copyWith(color: Colors.black, fontSize: 14),
                ),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (_keyMenu != MenuItem.MENU_CONTACT_US) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ContactUs()));
                }
              },
              child: Container(
                child: Text(
                  "聯絡我們",
                  style: CustomTextStyle.regularTextStyle
                      .copyWith(color: Colors.black, fontSize: 14),
                ),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
              child: Container(
                margin: EdgeInsets.only(right: 48),
                child: Text(
                  "登入/註冊",
                  style: CustomTextStyle.regularTextStyle
                      .copyWith(color: Colors.black, fontSize: 14),
                ),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              ),
            ),
          ],
        ),
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              })
        ],
      );
    }
  }
}
