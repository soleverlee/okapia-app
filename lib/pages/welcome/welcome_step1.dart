import 'package:flutter/material.dart';
import 'package:okapia_app/pages/colors.dart';
import 'package:okapia_app/pages/welcome/welcome_widget.dart';


class WelcomeStep1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: WelcomeWidgetStyle.LEFT_MARGIN, right: WelcomeWidgetStyle.RIGHT_MARGIN),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text("Okapia能够帮助您记住各种密码，而无需当心安全问题，让您不必再为忘记密码而烦恼",
              style: WelcomeWidgetStyle.SubTextStyle),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Center(
              child: Image(
                height: 187,
                width: 250,
                image: AssetImage("assets/welcome_step1_bg.png"),
              ),
            ),
          ),
          Text("在开始使用之前，您需要完成一些必要的设置。", style: WelcomeWidgetStyle.SubTextStyle),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: WelcomeWidgetStyle.BOTTOM_MARGIN),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    height: 1,
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: Text("开始设置",
                        style:
                        TextStyle(fontSize: 18, color: PageColors.orange1)),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

}