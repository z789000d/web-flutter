import 'package:flutter/material.dart';
import 'package:untitled/pages/drawer_menu.dart';
import 'package:untitled/pages/footer.dart';
import 'package:untitled/pages/header.dart';
import 'package:untitled/pages/home_slider.dart';
import 'package:untitled/productPage.dart';
import 'package:untitled/utils/CustomTextStyle.dart';
import 'package:untitled/utils/MenuItem.dart';
import 'package:untitled/utils/ResponsiveLayout.dart';

class LargeHomePage extends StatefulWidget {
  const LargeHomePage({Key? key}) : super(key: key);

  @override
  _LargeHomePageState createState() => _LargeHomePageState();
}

class _LargeHomePageState extends State<LargeHomePage> {
  GlobalKey<ScaffoldState> keyScaffold = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return createScaffold(context);
  }

  createScaffold(context) {
    return Scaffold(
      key: keyScaffold,
      endDrawer: ResponsiveLayout.isSmallScreen(context)
          ? DrawerMenu(MenuItem.MENU_HOME)
          : null,
      body: Builder(builder: (context) {
        return Column(
          children: [
            Header(MenuItem.MENU_HOME, context),
            Expanded(
              child: ListView(
                children: <Widget>[
                  HomeSlider(context),
                  Column(
                    children: contentView(),
                  ),
                  Footer()
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  List<Widget> contentView() {
    List<Widget> contentList = [];

    for (int i = 3; i > 0; i--) {
      contentList.add(Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 10, bottom: 10),
          child: Stack(
            children: [
              Opacity(
                opacity: 0.5,
                child: Image(
                  image: AssetImage('banner/banner${i}.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                  child: Align(
                alignment: Alignment.center,
                child: Opacity(
                  opacity: 0.9,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => ProductPage()));
                      },
                      child: Text(
                        '活動商品',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )),
            ],
          )));
    }

    return contentList;
  }
}
