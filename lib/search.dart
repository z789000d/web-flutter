import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/pages/drawer_menu.dart';
import 'package:untitled/pages/footer.dart';
import 'package:untitled/pages/header.dart';
import 'package:untitled/utils/CustomTextStyle.dart';
import 'package:untitled/utils/MenuItem.dart';
import 'package:untitled/utils/ResponsiveLayout.dart';

class Search extends StatelessWidget {
  GlobalKey<ScaffoldState> keyScaffold = GlobalKey();
  double sliderHeight = 500;
  double sliderHeaderFontSize = 60;
  double childAspectRatio = 1.2;

  List<String> listName = [];

  @override
  Widget build(BuildContext context) {
    setUp(context);
    listName.add("樣式");
    listName.add("顏色");
    listName.add("大小");
    return createScaffold(context);
  }

  createScaffold(context) {
    return Scaffold(
      key: keyScaffold,
      endDrawer: DrawerMenu(MenuItem.MENU_SEARCH),
      body: Builder(builder: (context) {
        return ListView(
          children: <Widget>[
            Header(MenuItem.MENU_SEARCH, context),
            searchSection(),
            Footer()
          ],
        );
      }),
    );
  }

  searchSection() {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(),
            flex: 20,
          ),
          Expanded(
            flex: 60,
            child: Container(
              margin: EdgeInsets.only(top: 48, left: 24, right: 24, bottom: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      "搜尋 : ",
                      style:
                          CustomTextStyle.boldTextStyle.copyWith(fontSize: 24),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 24),
                    child: Stack(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.only(top: 8, bottom: 8, right: 48),
                            hintText: "產品名稱",
                            hintStyle: CustomTextStyle.regularTextStyle
                                .copyWith(color: Colors.grey),
                            labelStyle: CustomTextStyle.regularTextStyle,
                          ),
                        ),
                        Align(
                          child: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          heightFactor: 02,
                          alignment: Alignment.centerRight,
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Text(
                      "可以進階搜尋",
                      style: CustomTextStyle.regularTextStyle
                          .copyWith(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  ListView.builder(
                    itemBuilder: (context, position) {
                      return listSearchItem(listName[position]);
                    },
                    itemCount: listName.length,
                    shrinkWrap: true,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(),
            flex: 20,
          ),
        ],
      ),
    );
  }

  listSearchItem(String strTitle) {
    return Container(
      padding: EdgeInsets.only(top: 16, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Text(
                strTitle,
                style: CustomTextStyle.boldTextStyle,
              ),
              Expanded(
                child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: TextFormField(
                      style:  CustomTextStyle.regularTextStyle
                          .copyWith(color: Colors.black, fontSize: 16),
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.only(
                            top: 8, bottom: 8, right: 5, left: 5),
                        hintText: "輸入$strTitle",
                        hintStyle: CustomTextStyle.regularTextStyle
                            .copyWith(color: Colors.grey, fontSize: 16),
                        labelStyle: CustomTextStyle.regularTextStyle,
                      ),
                    )),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
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
}
