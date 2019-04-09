import 'package:flutter/material.dart';
import 'package:okapia_app/developer/dev_count.dart';
import 'package:okapia_app/developer/dev_pages.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeExPageState();
}

class _HomeExPageState extends State<HomePage> {
  static final int _initialIndex = 0;
  var _currentIndex = _initialIndex;
  var _pageController = PageController(initialPage: _initialIndex);
  var _pages = [
    DevEmpty(),
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
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("tab1")),
          BottomNavigationBarItem(
              icon: Icon(Icons.collections), title: Text("tab2")),
          BottomNavigationBarItem(icon: Icon(Icons.movie), title: Text("tab3")),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text("tab4")),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          _pageChange(index);
          _pageController.jumpToPage(index);
        },
      ),
    );
  }
}
