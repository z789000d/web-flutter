

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/pages/drawer_menu.dart';
import 'package:untitled/pages/footer.dart';
import 'package:untitled/pages/header.dart';
import 'package:untitled/utils/CustomTextStyle.dart';
import 'package:untitled/utils/MenuItem.dart';
import 'package:untitled/utils/ResponsiveLayout.dart';

class AboutUs extends StatelessWidget {
  GlobalKey<ScaffoldState> keyScaffold = GlobalKey();
  double sliderHeight = 500;
  double sliderHeaderFontSize = 60;
  double childAspectRatio=1.2;

  @override
  Widget build(BuildContext context) {
    setUp(context);
    return createScaffold(context);
  }

  createScaffold(context) {
    return Scaffold(
      key: keyScaffold,
      endDrawer: DrawerMenu(MenuItem.MENU_ABOUT),
      body: Builder(builder: (context) {
        return ListView(
          children: <Widget>[
            Header(MenuItem.MENU_ABOUT,context),
            slider(),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: getGridCount(context), childAspectRatio: childAspectRatio),
              itemBuilder: (context, position) {
                return createList()[position];
              },
              itemCount: createList().length,
              shrinkWrap: true,
              primary: false,
            ),
            shootingCampaign(context),
            Footer()
          ],
        );
      }),
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
                image: AssetImage("about_us_slider.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  child: Text(
                    "關於我們",
                    textAlign: TextAlign.center,
                    style: CustomTextStyle.boldTextStyle.copyWith(
                        fontSize: sliderHeaderFontSize, color: Colors.white),
                  )),
            )
          ],
        ));
  }

  List<Container> createList() {
    List<Container> listContainer = [];
    listContainer.add(createAboutSection(
        "about_section_1.jpg",
        "標題1",
        "副標題1"));
    listContainer.add(createAboutSection(
        "about_section_2.jpg",
        "標題2",
        "副標題2"));
    listContainer.add(createAboutSection(
        "about_section_3.jpg",
        "標題3",
        "副標題3"));
    return listContainer;
  }

  createAboutSection(String imgName, String title, String desc) {
    return Container(
      margin: EdgeInsets.only(left: 24,right: 24,top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image(image: AssetImage(imgName)),
          SizedBox(
            height: 8,
          ),
          Text(
            title,
            style: CustomTextStyle.boldTextStyle.copyWith(fontSize: 20),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            desc,
            style: CustomTextStyle.regularTextStyle
                .copyWith(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  shootingCampaign(context) {
    if(ResponsiveLayout.isSmallScreen(context)){
      return Container(
        margin: EdgeInsets.only(top: 48,bottom: 48,left: 24,right: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            columnCampaign(),
            SizedBox(height: 20,),
            columnProgress(),
          ],
        ),
      );
    }
    else{
      return Container(
        margin: EdgeInsets.only(top: 48,bottom: 48),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 24),
                child: columnCampaign(),
              ),
              flex: 40,
            ),
            Expanded(
              child: Container(),
              flex: 10,
            ),
            Expanded(
              child: columnProgress(),
              flex: 40,
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

  Column columnProgress() {
    return Column(
      children: <Widget>[
        createProgress("網路設計", 76),
        createProgress("發展", 45),
        createProgress("計畫", 58),
        createProgress("行銷", 83),
      ],
    );
  }

  Column columnCampaign() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Text(
            "目標",
            style:
            CustomTextStyle.boldTextStyle.copyWith(fontSize: 24),
          ),
        ),
        Container(
          width: 40,
          height: 2,
          color: Colors.black,
          margin: EdgeInsets.only(bottom: 16),
        ),
        Wrap(
          children: <Widget>[
            Text(
              'xxxxxtttt',
              style: CustomTextStyle.regularTextStyle.copyWith(
                  fontSize: 16, color: Colors.grey, letterSpacing: 2),
              softWrap: true,
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }

  createProgress(String title, double value) {
    return Container(
      padding: EdgeInsets.only(top: 8,bottom: 8),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style: CustomTextStyle.boldTextStyle,
              ),
              Text(
                value.toString() + "%",
                style:
                CustomTextStyle.boldTextStyle.copyWith(color: Colors.grey),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          LinearProgressIndicator(
            backgroundColor: Colors.grey,
            value: value/100,
            valueColor: AlwaysStoppedAnimation(Colors.black),
          )
        ],
      ),
    );
  }
}
