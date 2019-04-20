import 'package:flutter/material.dart';
import 'package:okapia_app/developer/dev_count.dart';
import 'package:okapia_app/developer/dev_pages.dart';
import 'package:okapia_app/pages/index/index.dart';
import 'package:okapia_app/themes/base.dart';
import 'package:okapia_app/themes/index.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeExPageState();
}

class _HomeExPageState extends State<HomePage> {
  static final int _initialIndex = 0;
  var _currentIndex = _initialIndex;
  var _pageController = PageController(initialPage: _initialIndex);
  var _pages = [
    IndexPage(),
    DevEmpty(),
    DevPages(),
    DevCountPage(title: "test")
  ];

  void _pageChange(int index) {
    setState(() {
      if (_currentIndex != index) {
        _currentIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemBuilder: (context, index) {
          return _pages[index];
        },
        controller: _pageController,
        itemCount: _pages.length,
        onPageChanged: (int index) {
          _pageChange(index);
        },
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BasicTheme(
        themeData: Themes.buildBottomNavigationBarTheme(context),
        widget: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.list), title: Text("浏览")),
            BottomNavigationBarItem(
                icon: Icon(Icons.collections), title: Text("分类")),
            BottomNavigationBarItem(
                icon: Icon(Icons.share), title: Text("更多工具")),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                title: Text("设置"),
                backgroundColor: Colors.red),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) {
            _pageChange(index);
            _pageController.jumpToPage(index);
          },
        ),
      ).build(),
    );
  }
}
