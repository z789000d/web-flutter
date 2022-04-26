import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/pages/drawer_menu.dart';
import 'package:untitled/pages/footer.dart';
import 'package:untitled/pages/header.dart';
import 'package:untitled/utils/CustomTextStyle.dart';
import 'package:untitled/utils/MenuItem.dart';
import 'package:untitled/utils/ResponsiveLayout.dart';

class ContactUs extends StatelessWidget {
  GlobalKey<ScaffoldState> keyScaffold = GlobalKey();
  double sliderHeight = 500;
  double sliderHeaderFontSize = 60;
  double childAspectRatio = 1.2;

  @override
  Widget build(BuildContext context) {
    setUp(context);
    return createScaffold(context);
  }

  createScaffold(context) {
    return Scaffold(
      key: keyScaffold,
      endDrawer: DrawerMenu(MenuItem.MENU_CONTACT_US),
      body: Builder(builder: (context) {
        return ListView(
          children: <Widget>[
            Header(MenuItem.MENU_CONTACT_US, context),
            slider(),
            contactUsForm(context),
            Footer()
          ],
        );
      }),
    );
  }

  contactUsForm(context) {
    if (!ResponsiveLayout.isLargeScreen(context)) {
      return Container(
        padding: EdgeInsets.only(right: 12, left: 12),
        child: Column(
          children: <Widget>[createOurContact(), createForm()],
        ),
      );
    } else {
      return Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(),
              flex: 10,
            ),
            Expanded(
              child: Container(
                alignment: Alignment.topLeft,
                child: createOurContact(),
              ),
              flex: 30,
            ),
            Expanded(
              child: Container(
                child: createForm(),
              ),
              flex: 50,
            ),
            Expanded(
              child: Container(),
              flex: 10,
            ),
          ],
        ),
      );
    }
  }

  createOurContact() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: 16,
          ),
          child: Text(
            "聯絡我們",
            style: CustomTextStyle.boldTextStyle.copyWith(fontSize: 24),
          ),
        ),
        Container(
          width: 40,
          height: 2,
          color: Colors.black,
        ),
        Container(
          margin: EdgeInsets.only(
            top: 48,
          ),
          child: Text(
            '請輸入內容xxxxxxx 留言',
            style: CustomTextStyle.regularTextStyle
                .copyWith(fontSize: 16, color: Colors.grey),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: 8,
          ),
          child: Text(
            "地址: xxxxxx",
            style: CustomTextStyle.regularTextStyle
                .copyWith(fontSize: 16, color: Colors.grey),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: 8,
          ),
          child: Text(
            "營業時間: 9am to 8pm",
            style: CustomTextStyle.regularTextStyle
                .copyWith(fontSize: 16, color: Colors.grey),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 8, bottom: 24),
          child: Text(
            "信箱: info@yoursite.com",
            style: CustomTextStyle.regularTextStyle
                .copyWith(fontSize: 16, color: Colors.grey),
          ),
        ),
      ],
    );
  }

  createForm() {
    return Container(
      child: Form(
          child: Column(
        children: <Widget>[
          SizedBox(
            height: 24,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: border,
              hintText: "姓名",
              labelStyle: CustomTextStyle.regularTextStyle
                  .copyWith(color: Colors.black, fontSize: 20),
              hintStyle:
                  CustomTextStyle.regularTextStyle.copyWith(color: Colors.grey),
              enabledBorder: border,
              focusedBorder: border,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: border,
              hintText: "Email",
              labelStyle: CustomTextStyle.regularTextStyle
                  .copyWith(color: Colors.black, fontSize: 20),
              hintStyle:
                  CustomTextStyle.regularTextStyle.copyWith(color: Colors.grey),
              enabledBorder: border,
              focusedBorder: border,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          TextFormField(
            keyboardType: TextInputType.url,
            decoration: InputDecoration(
              border: border,
              hintText: "網誌",
              labelStyle: CustomTextStyle.regularTextStyle
                  .copyWith(color: Colors.black, fontSize: 20),
              hintStyle:
                  CustomTextStyle.regularTextStyle.copyWith(color: Colors.grey),
              enabledBorder: border,
              focusedBorder: border,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          TextFormField(
            maxLines: 5,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              border: border,
              hintText: "留言",
              labelStyle: CustomTextStyle.regularTextStyle
                  .copyWith(color: Colors.black, fontSize: 20),
              hintStyle:
                  CustomTextStyle.regularTextStyle.copyWith(color: Colors.grey),
              enabledBorder: border,
              focusedBorder: border,
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: RaisedButton.icon(
              onPressed: () {},
              color: Colors.black,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(2))),
              label: Text(
                "訂閱",
                style: CustomTextStyle.regularTextStyle
                    .copyWith(color: Colors.white, fontSize: 14),
              ),
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
        ],
      )),
    );
  }

  var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(0),
      borderSide: BorderSide(color: Colors.grey.shade300, width: 1));

  setUp(context) {
    if (ResponsiveLayout.isLargeScreen(context)) {
      sliderHeight = MediaQuery.of(context).size.height / 2;
      sliderHeaderFontSize = 60;
      childAspectRatio = 1.2;
    } else if (ResponsiveLayout.isMediumScreen(context)) {
      sliderHeight = MediaQuery.of(context).size.height / 2;
      sliderHeaderFontSize = 30;
      childAspectRatio = 1.25;
    } else {
      sliderHeight = MediaQuery.of(context).size.height / 3;
      sliderHeaderFontSize = 20;
      childAspectRatio = 1.2;
    }
  }

  slider() {
    return Container(
        width: double.infinity,
        height: sliderHeight,
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Image(
                image: AssetImage("contact_us_slider.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  child: Text(
                    "聯絡我們",
                    textAlign: TextAlign.center,
                    style: CustomTextStyle.boldTextStyle.copyWith(
                        fontSize: sliderHeaderFontSize,
                        color: Colors.black.withOpacity(.5)),
                  )),
            )
          ],
        ));
  }
}
