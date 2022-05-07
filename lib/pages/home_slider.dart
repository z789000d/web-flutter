import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../productPage.dart';
import '../utils/CustomTextStyle.dart';
import '../utils/ResponsiveLayout.dart';

class HomeSlider extends StatefulWidget {
  HomeSlider(this.parentContext, {Key? key}) : super(key: key);
  late var parentContext;

  @override
  HomeSliderState createState() => HomeSliderState();
}

class HomeSliderState extends State<HomeSlider> {
  double sliderHeight = 600;
  double sliderHeaderFontSize = 60;
  List<String> listImage = [];
  List<String> listBannerTitle = [];
  int pageViewIndex = 0;

  @override
  initState() {
    bannerList();
    bannerTitle();
    setUp(widget.parentContext);
    super.initState();
  }

  setUp(context) {
    if (ResponsiveLayout.isLargeScreen(context)) {
      sliderHeight = MediaQuery.of(context).size.height;
      sliderHeaderFontSize = 60;
    } else if (ResponsiveLayout.isMediumScreen(context)) {
      sliderHeight = MediaQuery.of(context).size.height / 2;
      sliderHeaderFontSize = 30;
    } else {
      sliderHeight = MediaQuery.of(context).size.height / 3;
      sliderHeaderFontSize = 20;
    }
  }

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
  Widget build(BuildContext context) {
    return sliderSection(context);
  }

  sliderSection(context) {
    return Stack(
      children: <Widget>[
        Container(
          height: sliderHeight,
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

  createSlider(position) {
    var alignment;
    var crossAxisAlignment;
    var textAlign;
    if (position == 0) {
      alignment = Alignment.center;
      textAlign = TextAlign.center;
      crossAxisAlignment = CrossAxisAlignment.center;
    } else if (position == 1) {
      alignment = Alignment.topLeft;
      textAlign = TextAlign.start;
      crossAxisAlignment = CrossAxisAlignment.start;
    } else {
      alignment = Alignment.topRight;
      textAlign = TextAlign.end;
      crossAxisAlignment = CrossAxisAlignment.end;
    }
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ProductPage()));
      },
      child: Container(
          width: double.infinity,
          child: Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Image(
                  image: AssetImage(listImage[position]),
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                alignment: alignment,
                margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: crossAxisAlignment,
                  children: <Widget>[
                    Text(
                      listBannerTitle[position],
                      textAlign: textAlign,
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
}
