

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/CustomColors.dart';
import '../utils/CustomTextStyle.dart';
import '../utils/ResponsiveLayout.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: ResponsiveLayout.isSmallScreen(context)
          ? createFooterForMobile()
          : createFooterForWeb(),
    );
  }

  createFooterForWeb() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
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
                      image: AssetImage("ic_logo.png"),
                      width: 40,
                      height: 40,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "zzzzzzz",
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
                      "xxxxxxxx",
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
          flex: 30,
        ),
        Expanded(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 24,
                ),
                Container(
                  child: Text(
                    "聯絡我們",
                    style: CustomTextStyle.boldTextStyle
                        .copyWith(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "地址: xxxxx",
                  style: CustomTextStyle.regularTextStyle
                      .copyWith(color: CustomColors.TEXT_COLOR, fontSize: 14,),
                  textScaleFactor: 1.2,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "電話:Xxxxxxxx",
                  style: CustomTextStyle.regularTextStyle
                      .copyWith(color: CustomColors.TEXT_COLOR, fontSize: 14),
                ),

                SizedBox(
                  height: 8,
                ),
                Text(
                  "手機: 09xxxxxxx",
                  style: CustomTextStyle.regularTextStyle
                      .copyWith(color: CustomColors.TEXT_COLOR, fontSize: 14),
                ),

                SizedBox(
                  height: 8,
                ),
                Text(
                  "e-mail: xxxx@gamil.com",
                  style: CustomTextStyle.regularTextStyle
                      .copyWith(color: CustomColors.TEXT_COLOR, fontSize: 14),
                ),

                SizedBox(
                  height:24,
                ),
              ],
            ),
          ),
          flex: 30,
        ),
        Expanded(
          child: Container(),
          flex: 20,
        ),
        Expanded(
          child: Container(),
          flex: 20,
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
                    image: AssetImage("ic_logo.png"),
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "zzzzzzz",
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
                    "xxxxxxxx",
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
                child: Text(
                  "地址:",
                  style: CustomTextStyle.boldTextStyle
                      .copyWith(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "xxxxxxx",
                style: CustomTextStyle.regularTextStyle
                    .copyWith(color: CustomColors.TEXT_COLOR, fontSize: 12),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "電話: xxxxxxxx",
                style: CustomTextStyle.regularTextStyle
                    .copyWith(color: CustomColors.TEXT_COLOR, fontSize: 12),
              ),

              SizedBox(
                height: 8,
              ),
              Text(
                "手機: 09xxxxxxx",
                style: CustomTextStyle.regularTextStyle
                    .copyWith(color: CustomColors.TEXT_COLOR, fontSize: 12),
              ),

              SizedBox(
                height: 8,
              ),
              Text(
                "e-mail: xxx@gmail.com",
                style: CustomTextStyle.regularTextStyle
                    .copyWith(color: CustomColors.TEXT_COLOR, fontSize: 12),
              ),

              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
