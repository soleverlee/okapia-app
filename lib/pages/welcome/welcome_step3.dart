import 'package:flutter/material.dart';
import 'package:okapia_app/pages/colors.dart';
import 'package:okapia_app/pages/welcome/welcome_widget.dart';



class WelcomeStep3 extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback onBefore;

  const WelcomeStep3({Key key, this.onNext, this.onBefore}) : super(key: key);

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      padding: const EdgeInsets.only(
          left: WelcomeWidgetStyle.LEFT_MARGIN,
          right: WelcomeWidgetStyle.RIGHT_MARGIN),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text("指纹解锁能够帮助您记住密码，只需要验证指纹即可访问您的密码仓库。当您开启这个选项的时候，请确保您的手机只能被自己访问。",
              style: WelcomeWidgetStyle.SubTextStyle),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Center(
              child: Image(
                height: 235,
                width: 250,
                image: AssetImage("assets/welcome_step3_bg.png"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("指纹解锁"),
                Row(
                  children: <Widget>[
                    Text(
                      "关闭",
                    ),
                    Icon(
                        Icons.keyboard_arrow_right,
                        color: PageColors.grey1)
                  ],
                )
              ],
            ),
          ),
          Divider(
            height: 1,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 60,
                  bottom: WelcomeWidgetStyle.BOTTOM_MARGIN),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                      onTap: onBefore,
                      child: Text("上一步", style:WelcomeWidgetStyle.OriginTextStyle)),
                  GestureDetector(
                    onTap: onNext,
                    child: Text(
                      "开始使用",
                      style: WelcomeWidgetStyle.OriginTextStyle,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
