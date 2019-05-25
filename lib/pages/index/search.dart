import 'package:flutter/material.dart';
import 'package:okapia_app/base/base_bloc.dart';
import 'package:okapia_app/blocs/record_bloc.dart';
import 'package:okapia_app/entities/record.dart';
import 'package:okapia_app/models/record_view.dart';
import 'package:okapia_app/pages/colors.dart';
import 'package:okapia_app/pages/widgets/link_button.dart';
import 'package:okapia_app/pages/widgets/list_item.dart';
import 'package:okapia_app/pages/widgets/list_title.dart';
import 'package:okapia_app/pages/widgets/search_bar.dart';
import 'package:okapia_app/routers.dart';
import 'package:okapia_app/themes/index.dart';

class IndexSearchPageContainer extends StatefulWidget {
  @override
  State<IndexSearchPageContainer> createState() =>
      _IndexSearchPageContainerState();
}

class _IndexSearchPageContainerState extends State<IndexSearchPageContainer> {
  RecordBloc recordBloc;

  @override
  void initState() {
    super.initState();
    recordBloc = RecordBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RecordBloc>(
      bloc: recordBloc,
      child: _IndexSearchPage(),
    );
  }
}

class _IndexSearchPage extends StatefulWidget {
  @override
  _IndexSearchState createState() => _IndexSearchState();
}

class _IndexSearchState extends State<_IndexSearchPage> {
  bool isSearched = false;

  final TextEditingController keywordController =
      TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    RecordBloc recordBloc = BlocProvider.of<RecordBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            buildSearchInput(recordBloc),
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
      body: isSearched
          ? buildSearchResultList(recordBloc)
          : buildHistoryContainer(recordBloc),
    );
  }

  Flexible buildSearchInput(RecordBloc recordBloc) {
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
            recordBloc.doQueryRecordListByTitle(value);
            recordBloc.updateHistoryList(value);
            setState(() {
              isSearched = true;
            });
          }
        },
      ),
    );
  }

  StreamBuilder buildSearchResultList(RecordBloc recordBloc) {
    return StreamBuilder(
      stream: recordBloc.searchPageController.stream,
      initialData: recordBloc.searchPageController.value,
      builder: (context, snapshot) {
        RecordView recordView = snapshot.data.recordView;
        int count = recordView.count;
        bool isLoaded = recordView.isLoaded;
        List<RecordEntity> list = recordView.list;
        return Column(
          children: <Widget>[
            ListTitle(
              title: "以下是包含${keywordController.text}的结果 ($count)",
            ),
            buildContainerList(list, isLoaded),
          ],
        );
      },
    );
  }

  Widget buildContainerList(List<RecordEntity> recordList, bool isLoaded) {
    if (isLoaded) {
      if (recordList.length > 0) {
        return Expanded(
          child: ListView.builder(
            itemCount: recordList.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              RecordEntity record = recordList[index];
              return ListItem(
                title: record.title,
                onTap: () {
                  Routers.router.navigateTo(
                    context,
                    "/detail/${record.title}",
                  );
                },
              );
            },
          ),
        );
      } else {
        return Container(
          margin: EdgeInsets.only(top: 150.0),
          alignment: AlignmentDirectional.center,
          child: Text("No Results Found"),
        );
      }
    } else {
      return Container(
        margin: EdgeInsets.only(top: 150.0),
        alignment: AlignmentDirectional.center,
        child: CircularProgressIndicator(),
      );
    }
  }

  GestureDetector buildHistoryContainer(RecordBloc recordBloc) {
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
            generateLinkButtons(recordBloc),
          ],
        ),
      ),
    );
  }

  StreamBuilder generateLinkButtons(RecordBloc recordBloc) {
    return StreamBuilder(
      stream: recordBloc.searchPageController.stream,
      initialData: recordBloc.searchPageController.value,
      builder: (context, snapshot) {
        List<String> historyList = snapshot.data.historyList;
        if (historyList.length > 0) {
          return Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Row(
              children: historyList
                  .asMap()
                  .map((index, history) =>
                  MapEntry(
                      index,
                      LinkButton(
                        title: history,
                        padding: EdgeInsets.only(
                            top: 10.0,
                            left: index == 0 ? 0 : 10.0,
                            right: 10.0),
                        onTap: () {
                          Routers.router.navigateTo(
                            context,
                            "/detail/$history",
                          );
                        },
                      )))
                  .values
                  .toList(),
            ),
          );
        } else {
          return Container(
            padding: EdgeInsets.only(left: 20.0, top: 10.0),
            child: Text(
              "No History Yet!!!",
              style: TextStyle(color: PageColors.orange1),
            ),
          );
        }
      },
    );
  }
}
