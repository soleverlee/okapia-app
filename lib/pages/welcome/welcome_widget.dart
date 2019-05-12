import 'package:flutter/material.dart';
import 'package:okapia_app/pages/colors.dart';
import 'package:okapia_app/pages/welcome/welcome_step1.dart';
import 'package:okapia_app/pages/welcome/welcome_step2.dart';
import 'package:okapia_app/pages/welcome/welcome_step3.dart';
import 'package:okapia_app/routers.dart';

class WelcomeWidgetStyle {
  static const double LEFT_MARGIN = 55.0;
  static const double RIGHT_MARGIN = 55.0;
  static const SubTextStyle = TextStyle(color: PageColors.grey1);
  static const double BOTTOM_MARGIN = 80.0;
  static const OriginTextStyle = TextStyle(fontSize: 18, color: PageColors.orange1);
}

class WelcomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WelcomeState();
}

class _WelcomeState extends State<WelcomeWidget> {
  List<Widget> _stepPages;
  List<String> _stepTitles;

  PageController _pageController = PageController();

  int _curStep = 0;

  void _stepTo(int index) {
    _pageController.animateToPage(index,
        duration: Duration(milliseconds: 300), curve: Curves.linear);
  }

  @override
  void initState() {
    super.initState();
    _stepTitles = ["欢迎使用Okapia", "设置主密码", "开启指纹解锁"];
    _stepPages = [
      WelcomeStep1(
        onNext: () => _stepTo(1),
      ),
      WelcomeStep2(
        onNext: () => _stepTo(2),
      ),
      WelcomeStep3(
        onBefore: ()=>_stepTo(1),
        onNext: () => Routers.router.navigateTo(context, "/home"),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: PageColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTitle(context),
          _buildLines(context),
          Expanded(child: _buildSteps(context))
        ],
      ),
    ));
  }

  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: WelcomeWidgetStyle.LEFT_MARGIN, top: 70),
      child: Text(_stepTitles[_curStep],
          style: TextStyle(
              color: PageColors.black1,
              fontSize: 20.0,
              fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildLines(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: WelcomeWidgetStyle.LEFT_MARGIN,
          right: WelcomeWidgetStyle.RIGHT_MARGIN,
          top: 10,
          bottom: 10),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(_stepPages.length,
              (index) => _ShortLine(select: index == _curStep))),
    );
  }

  Widget _buildSteps(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      onPageChanged: (index) {
        setState(() {
          _curStep = index;
        });
      },
      itemBuilder: (BuildContext context, int index) => _stepPages[index],
      itemCount: _stepPages.length,
    );
  }
}

class _ShortLine extends StatelessWidget {
  final bool select;

  const _ShortLine({Key key, this.select}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 1,
      color: select ? PageColors.orange1 : Colors.grey,
    );
  }
}
