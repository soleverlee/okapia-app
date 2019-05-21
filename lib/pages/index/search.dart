import 'package:flutter/material.dart';
import 'package:okapia_app/base/base_bloc.dart';
import 'package:okapia_app/blocs/record_bloc.dart';
import 'package:okapia_app/pages/colors.dart';
import 'package:okapia_app/pages/widgets/link_button.dart';
import 'package:okapia_app/pages/widgets/list_item.dart';
import 'package:okapia_app/pages/widgets/list_title.dart';
import 'package:okapia_app/pages/widgets/search_bar.dart';
import 'package:okapia_app/themes/index.dart';

class IndexSearchPageContainer extends StatefulWidget {
  @override
  State<IndexSearchPageContainer> createState() =>
      IndexSearchPageContainerState();
}

class IndexSearchPageContainerState extends State<IndexSearchPageContainer> {
  RecordBloc recordBloc;

  @override
  void initState() {
    super.initState();
    recordBloc = RecordBloc();
    recordBloc.doQueryRecordList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: recordBloc,
      child: IndexSearchPage(),
    );
  }
}

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
    RecordBloc recordBloc = BlocProvider.of<RecordBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            buildSearchInput(),
            GestureDetector(
              child: Text(
                "取消",
                style: TextStyle(color: PageColors.white, fontSize: 16.0),
              ),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
        backgroundColor: PageColors.orange1,
        elevation: 0.0,
        iconTheme: IconThemeData(color: PageColors.white),
        textTheme: Themes.appBarTextTheme,
        automaticallyImplyLeading: false,
      ),
      body: isSearched ? buildSearchResultList() : buildHistoryContainer(),
    );
  }

  Flexible buildSearchInput() {
    return Flexible(
      child: SearchBar(
        hintText: "请输入关键字查找",
        controller: keywordController,
        margin: EdgeInsets.only(right: 15.0),
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
    );
  }

  Column buildSearchResultList() {
    return Column(
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
    );
  }

  GestureDetector buildHistoryContainer() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              padding: EdgeInsets.only(top: 19.0, bottom: 11.0, left: 20.0),
              decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: PageColors.grey2),
                  )),
              child: Text(
                "最近搜索",
                style: TextStyle(color: PageColors.black1, fontSize: 14.0),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20.0),
              child: Row(
                children: <Widget>[
                  LinkButton(
                    title: "淘宝",
                    padding: EdgeInsets.only(top: 10.0, right: 10.0),
                    onTap: () => print("淘宝"),
                  ),
                  LinkButton(
                    title: "支付宝",
                    padding:
                    EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                    onTap: () => print("支付宝"),
                  ),
                  LinkButton(
                    title: "JD",
                    padding:
                    EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                    onTap: () => print("JD"),
                  ),
                  LinkButton(
                    title: "t",
                    padding:
                    EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                    onTap: () => print("t"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
