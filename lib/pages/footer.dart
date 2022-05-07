import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/CustomColors.dart';
import '../utils/CustomTextStyle.dart';
import '../utils/ResponsiveLayout.dart';
import 'dart:js' as js;
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      color: Colors.black,
      child: ResponsiveLayout.isSmallScreen(context)
          ? createFooterForMobile()
          : createFooterForWeb(),
    );
  }

  createFooterForWeb() {
    return Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Image(
                    image: AssetImage("home_icon.jpg"),
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "cloud sis",
                    style: CustomTextStyle.regularTextStyle
                        .copyWith(color: Colors.white),
                  )
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                margin: EdgeInsets.only(left: 4),
                child: InkWell(
                  child: Text(
                    "支援信用卡類型",
                    style: CustomTextStyle.regularTextStyle
                        .copyWith(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image(
                    image: AssetImage("payment/footer_payment.png"),
                  )
                ],
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(right: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Text(
                    "聯絡我們:",
                    style: CustomTextStyle.boldTextStyle
                        .copyWith(color: Colors.white),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    goToFb();
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Image(
                      image: AssetImage("facebook.png"),
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    goToIg();
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Image(
                      image: AssetImage("instagram.png"),
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    goToLine();
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Image(
                      image: AssetImage("line.png"),
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  createFooterForMobile() {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Image(
                    image: AssetImage("home_icon.jpg"),
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "cloud sis",
                    style: CustomTextStyle.regularTextStyle
                        .copyWith(color: Colors.white),
                  )
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                margin: EdgeInsets.only(left: 4),
                child: InkWell(
                  child: Text(
                    "支援信用卡類型",
                    style: CustomTextStyle.regularTextStyle
                        .copyWith(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Image(
                image: AssetImage("payment/footer_payment.png"),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Row(
                  children: [
                    Container(
                      child: Text(
                        "聯絡我們:",
                        style: CustomTextStyle.boldTextStyle
                            .copyWith(color: Colors.white),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        goToFb();
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Image(
                          image: AssetImage("facebook.png"),
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        goToIg();
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Image(
                          image: AssetImage("instagram.png"),
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        goToLine();
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Image(
                          image: AssetImage("line.png"),
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  goToIg() {
    var url = 'https://www.instagram.com/cloudsis2020/';
    js.context.callMethod('open', [url]);
  }

  goToFb() {
    var url =
        'https://www.facebook.com/pages/category/Shopping---retail/Cloudsis-570959850248484/';
    js.context.callMethod('open', [url]);
  }

  goToLine() {
    var url = 'https://lin.ee/c9uLZIh';
    js.context.callMethod('open', [url]);
  }
}
