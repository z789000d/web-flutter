import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 8, bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Image(
                  image: AssetImage("ic_logo.png"),
                  height: 40,
                  width: 40,
                ),
                margin: EdgeInsets.only(left: 24),
              ),
            ],
          ),
        ),
        createMenu(context)
      ],
    );
  }

  createMenu(context) {
    if (ResponsiveLayout.isMediumScreen(context) ||
        ResponsiveLayout.isLargeScreen(context)) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            child: Text(
              "首頁",
              style: CustomTextStyle.boldTextStyle.copyWith(
                color: Colors.black,
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          ),
          GestureDetector(
            onTap: () {
              if (_keyMenu != MenuItem.MENU_SEARCH) {
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (context) => Search()));
              }
            },
            child: Container(
              child: Text(
                "搜尋",
                style: CustomTextStyle.boldTextStyle.copyWith(
                  color: Colors.black,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (_keyMenu != MenuItem.MENU_CART) {
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (context) => Cart()));
              }
            },
            child: Container(
              child: Text(
                "購物車",
                style: CustomTextStyle.boldTextStyle.copyWith(
                  color: Colors.black,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (_keyMenu != MenuItem.MENU_PROFILE) {
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (context) => Profile()));
              }
            },
            child: Container(
              child: Text(
                "簡介",
                style: CustomTextStyle.boldTextStyle.copyWith(
                  color: Colors.black,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (_keyMenu != MenuItem.MENU_ABOUT) {
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (context) => AboutUs()));
              }
            },
            child: Container(
              child: Text(
                "關於我們",
                style: CustomTextStyle.boldTextStyle.copyWith(
                  color: Colors.black,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (_keyMenu != MenuItem.MENU_CONTACT_US) {
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (context) => ContactUs()));
              }
            },
            child: Container(
              child: Text(
                "聯絡我們",
                style: CustomTextStyle.boldTextStyle.copyWith(
                  color: Colors.black,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => Login()));
            },
            child: Container(
              margin: EdgeInsets.only(right: 48),
              child: Text(
                "登入/註冊",
                style: CustomTextStyle.boldTextStyle.copyWith(
                  color: Colors.black,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            ),
          ),
        ],
      );
    } else {
      return Row(
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
