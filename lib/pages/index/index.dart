import 'package:flutter/material.dart';
import 'package:okapia_app/application.dart';
import 'package:okapia_app/models/password.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Column(
        children: <Widget>[
          FutureBuilder(
            future: Application.passwordDBProvider.getPasswordsListCount(),
            builder: (context, snapshot) {
              var count = 0;
              if (snapshot.hasData) {
                count = snapshot.data['count'] as int;
              }
              return ListTitle(title: "我的全部密码 ($count)");
            },
          ),
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

  Widget buildContainerList() {
    return FutureBuilder<List<Password>>(
      future: Application.passwordDBProvider.getAllPasswords(),
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          if (snapshot.hasData && snapshot.data.length > 0) {
            return Expanded(
              child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    Password password = snapshot.data[index];
                    return ListItem(
                      title: password.title,
                      onTap: () {
                        Routers.router.navigateTo(
                            context, "/detail/${password.title}");
                      },
                    );
                  }),
            );
          } else {
            return Container(
              margin: EdgeInsets.only(top: 150.0),
              alignment: AlignmentDirectional.center,
              child: Text("No Results Found"),
            );
          }
        }

        return Container(
          margin: EdgeInsets.only(top: 150.0),
          alignment: AlignmentDirectional.center,
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
