import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/productPage.dart';

import '../about_us.dart';
import '../cart.dart';
import '../contact_us.dart';
import '../home.dart';
import '../login.dart';
import '../profile.dart';
import '../search.dart';
import '../utils/CustomColors.dart';
import '../utils/CustomTextStyle.dart';
import '../utils/MenuItem.dart';

class DrawerMenu extends StatelessWidget {
  late String _keyMenu;

  DrawerMenu(this._keyMenu, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return createDrawer(context);
  }

  createDrawer(context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(0, 24, 0, 24),
            color: Colors.grey,
            child: Column(
              children: <Widget>[
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("home_icon.jpg"))),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "請登入",
                  style: CustomTextStyle.boldTextStyle
                      .copyWith(color: Colors.white, fontSize: 20),
                )
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          InkWell(
            onTap: () {
              if (_keyMenu != MenuItem.MENU_HOME) {
                Navigator.of(context).pop();
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Home()));
              }
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Text(
                "首頁",
                style: CustomTextStyle.boldTextStyle,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: () {
              if (_keyMenu != MenuItem.MENU_SEARCH) {
                Navigator.of(context).pop();
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Search()));
              }
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Text(
                "搜尋",
                style: CustomTextStyle.boldTextStyle,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: () {
              if (_keyMenu != MenuItem.MENU_PRODUCTLIST) {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProductPage()));
              }
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Text(
                "商品清單",
                style: CustomTextStyle.boldTextStyle,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: () {
              if (_keyMenu != MenuItem.MENU_CART) {
                Navigator.of(context).pop();
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Cart()));
              }
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Text(
                "購物車",
                style: CustomTextStyle.boldTextStyle,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: () {
              if (_keyMenu != MenuItem.MENU_PROFILE) {
                Navigator.of(context).pop();
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Profile()));
              }
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Text(
                "個人資料",
                style: CustomTextStyle.boldTextStyle,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: () {
              if (_keyMenu != MenuItem.MENU_ABOUT) {
                Navigator.of(context).pop();
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => AboutUs()));
              }
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Text(
                "關於我們",
                style: CustomTextStyle.boldTextStyle,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: () {
              if (_keyMenu != MenuItem.MENU_CONTACT_US) {
                Navigator.of(context).pop();
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => ContactUs()));
              }
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Text(
                "聯絡我們",
                style: CustomTextStyle.boldTextStyle,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: () {
              if (_keyMenu != MenuItem.MENU_LOGIN_SIGNUP) {
                Navigator.of(context).pop();
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Login()));
              }
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Text(
                "登入/註冊",
                style: CustomTextStyle.boldTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
