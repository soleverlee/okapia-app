import 'package:flutter/material.dart';

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
      appBar: buildAppBar(),
      body: Column(
        children: <Widget>[
          buildContainerTitle(context),
          buildContainerList(),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      elevation: 0.0,
      textTheme: TextTheme(
          title:
              TextStyle(fontSize: 18.0, color: Color.fromRGBO(0, 43, 54, 1))),
      iconTheme: IconThemeData(color: Color.fromRGBO(170, 170, 170, 1)),
      leading: IconButton(
          icon: Icon(Icons.search), iconSize: 30.0, onPressed: onSearch),
      actions: buildAppBarActions(),
    );
  }

  List<Widget> buildAppBarActions() {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.more_vert),
        iconSize: 30.0,
        onPressed: onMore,
      )
    ];
  }

  Expanded buildContainerList() {
    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: listItems.length,
          itemBuilder: (BuildContext context, int index) {
            return buildListItem(index);
          }),
    );
  }

  Column buildListItem(int index) {
    return Column(
      children: <Widget>[
        InkWell(
          child: Container(
            height: 35.0,
            padding: EdgeInsets.only(left: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  listItems[index],
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
                IconButton(
                  icon: Icon(Icons.navigate_next),
                  color: Color.fromRGBO(211, 211, 211, 1),
                ),
              ],
            ),
          ),
          onTap: onListItemDetail,
        ),
        Divider(),
      ],
    );
  }

  Container buildContainerTitle(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Color.fromRGBO(244, 244, 244, 1)),
      padding: EdgeInsets.only(top: 14.0, bottom: 14.0, left: 20.0),
      child: Text(
        "我的全部密码 (${listItems.length})",
        style: TextStyle(fontSize: 14.0, color: Color.fromRGBO(16, 16, 16, 1)),
      ),
    );
  }

  void onSearch() {
    print("search");
  }

  void onListItemDetail() {
    print("Taped");
  }

  void onMore() {
    print("more");
  }
}
