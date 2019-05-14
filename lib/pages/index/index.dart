import 'package:flutter/material.dart';
import 'package:okapia_app/base/base_bloc.dart';
import 'package:okapia_app/blocs/record_bloc.dart';
import 'package:okapia_app/entities/record.dart';
import 'package:okapia_app/pages/colors.dart';
import 'package:okapia_app/pages/widgets/list_item.dart';
import 'package:okapia_app/pages/widgets/list_title.dart';
import 'package:okapia_app/pages/widgets/search_bar.dart';
import 'package:okapia_app/routers.dart';
import 'package:okapia_app/themes/icons.dart';
import 'package:okapia_app/themes/index.dart';

class IndexPageContainer extends StatefulWidget {
  @override
  State<IndexPageContainer> createState() => IndexPageContainerState();
}

class IndexPageContainerState extends State<IndexPageContainer> {
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
      child: IndexPage(),
    );
  }
}

class IndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RecordBloc bloc = BlocProvider.of<RecordBloc>(context);
    return Scaffold(
      appBar: buildAppBar(context),
      body: StreamBuilder(
        stream: bloc.recordViewController.stream,
        initialData: bloc.recordViewController.value,
        builder: (context, snapshot) {
          int count = snapshot.data.count;
          bool isLoaded = snapshot.data.isLoaded;
          List<RecordEntity> list = snapshot.data.list;
          return Column(
            children: <Widget>[
              ListTitle(title: "我的全部密码 ($count)"),
              buildContainerList(list, isLoaded),
            ],
          );
        },
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

  Widget buildContainerList(List<RecordEntity> recordList, bool isLoaded) {
    if (isLoaded) {
      if (recordList.length > 0) {
        return Expanded(
          child: ListView.builder(
            itemCount: recordList.length,
            itemBuilder: (BuildContext context, int index) {
              RecordEntity record = recordList[index];
              return ListItem(
                title: record.title,
                onTap: () {
                  Routers.router
                      .navigateTo(context, "/detail/${record.title}");
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
}
