import 'package:flutter/material.dart';
import 'package:okapia_app/pages/colors.dart';
import 'package:okapia_app/pages/widgets/link_button.dart';
import 'package:okapia_app/pages/widgets/list_item.dart';
import 'package:okapia_app/pages/widgets/list_title.dart';
import 'package:okapia_app/themes/index.dart';

class IndexSearchPage extends StatefulWidget {
  @override
  IndexSearchState createState() => IndexSearchState();
}

class IndexSearchState extends State<IndexSearchPage> {
  bool isSearched = false;
  final List<String> listItems = [
    "招商银行信用卡",
    "银行0988",
    "建设银行网银",
  ];

  final TextEditingController keywordController =
      TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("搜索"),
        centerTitle: true,
        elevation: 0.0,
        textTheme: Themes.appBarTextTheme,
        leading: IconButton(
            icon: Icon(Icons.navigate_before),
            onPressed: () => Navigator.of(context).pop()),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () => print("tap"),
          )
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "请输入关键字查找",
                  border: InputBorder.none,
                ),
                autofocus: true,
                controller: keywordController,
                textInputAction: TextInputAction.search,
                onChanged: (value) {
                  if (value.length == 0) {
                    setState(() {
                      isSearched = false;
                    });
                  }
                },
                onSubmitted: (value) {
                  if (value.length > 0) {
                    setState(() {
                      isSearched = true;
                    });
                  }
                },
              ),
              padding: EdgeInsets.only(
                  top: 8.0, bottom: 8.0, left: 20.0, right: 20.0),
            ),
            isSearched ? buildSearchResultList() : buildHistoryContainer(),
          ],
        ),
      ),
    );
  }

  Expanded buildSearchResultList() {
    return Expanded(
      child: Column(
        children: <Widget>[
          ListTitle(
              title: "以下是包含${keywordController.text}的结果 (${listItems.length})"),
          Expanded(
            child: ListView.builder(
                itemCount: listItems.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return ListItem(
                    title: listItems[index],
                    onTap: () {
                      print("onTap");
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }

  Container buildHistoryContainer() {
    return Container(
      padding: EdgeInsets.only(top: 27.0, left: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "最近搜索",
            style: TextStyle(color: PageColors.color161616),
          ),
          Row(
            children: <Widget>[
              LinkButton(
                title: "淘宝",
                padding: EdgeInsets.only(top: 10.0, right: 10.0),
                onTap: () => print("淘宝"),
              ),
              LinkButton(
                title: "支付宝",
                padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                onTap: () => print("支付宝"),
              ),
              LinkButton(
                title: "JD",
                padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                onTap: () => print("JD"),
              ),
              LinkButton(
                title: "t",
                padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                onTap: () => print("t"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
