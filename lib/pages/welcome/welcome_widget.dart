import 'package:flutter/material.dart';
import 'package:okapia_app/pages/colors.dart';
import 'package:okapia_app/routers.dart';


class WelcomeWidgetStyle{
  static const  double LEFT_MARGIN = 55;
  static const double RIGHT_MARGIN = 55;
  static const SubTextStyle = TextStyle(color: PageColors.grey1);
  static const double BOTTOM_MARGIN = 60;
}


class WelcomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WelcomeState();
}

class _WelcomeState extends State<WelcomeWidget> {
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
            Expanded(child: _buildStep2(context))
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: WelcomeWidgetStyle.LEFT_MARGIN, top: 90),
      child: Text("欢迎使用Okapia",
          style: TextStyle(
              color: PageColors.color161616,
              fontSize: 20.0,
              fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildLines(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: WelcomeWidgetStyle.LEFT_MARGIN, right: WelcomeWidgetStyle.RIGHT_MARGIN, top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _ShortLine(select: false),
          _ShortLine(select: true),
          _ShortLine(select: false),
        ],
      ),
    );
  }

  Widget _buildStep2(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: WelcomeWidgetStyle.LEFT_MARGIN, right: WelcomeWidgetStyle.RIGHT_MARGIN),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
              "主密码是您保存其他密码的唯一凭证，请牢记这个密码并不要泄露给任何人。我们不会存储您的主密码，这也意味着当您忘记主密码时将没有任何办法可以恢复",
              style: WelcomeWidgetStyle.SubTextStyle),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Center(
              child: Image(
                height: 235,
                width: 250,
                image: AssetImage("assets/welcome_step2_bg.png"),
              ),
            ),
          ),
          _PasswordText(errorMsg: "密码需要包含数字和字母",),
          _PasswordText(errorMsg: "两次输入的密码不一致",),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: WelcomeWidgetStyle.BOTTOM_MARGIN),
                  child: Text(
                    "下一步",
                    style: TextStyle(fontSize: 18, color: PageColors.grey1),
                  ),
                )
              ],
            ),
          )
        ],
      ),
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

class _PasswordText extends StatelessWidget {
  final String errorMsg;
  final VoidCallback onTap;
  final bool errorState;

  const _PasswordText({Key key, this.errorMsg, this.onTap, this.errorState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context)
          .copyWith(primaryColor: Colors.red, hintColor: PageColors.grey2),
      child: TextField(
        onTap: onTap,
        maxLines: 1,
        obscureText: true,
        decoration: InputDecoration(
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: PageColors.orange1)),
            errorText: errorMsg),
      ),
    );
  }
}
