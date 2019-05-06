import 'package:flutter/material.dart';
import 'package:okapia_app/pages/colors.dart';
import 'package:okapia_app/pages/widgets/list_item.dart';
import 'package:okapia_app/pages/widgets/list_title.dart';
import 'package:okapia_app/pages/widgets/search_bar.dart';
import 'package:okapia_app/routers.dart';
import 'package:okapia_app/themes/icons.dart';
import 'package:okapia_app/themes/index.dart';

class IndexPage extends StatelessWidget {
  final String title;

  IndexPage({this.title = "Okapia"});

  final List<String> listItems = [
    "支付宝密码",
    "淘宝账号密码",
    "建设银行网银",
    "QQ密码",
    "支付宝密码",
    "淘宝账号密码",
    "建设银行网银",
    "QQ密码",
    "支付宝密码",
    "淘宝账号密码",
    "建设银行网银",
    "QQ密码"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Column(
        children: <Widget>[
          ListTitle(title: "我的全部密码 (${listItems.length})"),
          buildContainerList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: PageColors.orange1,
        onPressed: () {
          Routers.router.navigateTo(context, "/create");
        },
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Stack(
        children: <Widget>[
          Center(
            child: SearchBar(
              autoFocus: false,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            bottom: 0,
            right: 0,
            child: GestureDetector(
              child: Container(
                child: Text(''),
              ),
              onTap: () => Routers.router.navigateTo(context, "/search"),
            ),
          )
        ],
      ),
      elevation: 0.0,
      textTheme: Themes.appBarTextTheme,
      iconTheme: IconThemeData(color: PageColors.white),
      automaticallyImplyLeading: false,
      backgroundColor: PageColors.orange1,
      actions: <Widget>[
        IconButton(
          icon: Icon(AliIcon.help),
          iconSize: 26.0,
          onPressed: () => print("help"),
        )
      ],
    );
  }

  Expanded buildContainerList() {
    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: listItems.length,
          itemBuilder: (BuildContext context, int index) {
            return ListItem(
              title: listItems[index],
              onTap: () {
                print("onTap");
                Routers.router
                    .navigateTo(context, "/detail/${listItems[index]}");
              },
            );
          }),
    );
  }
}
