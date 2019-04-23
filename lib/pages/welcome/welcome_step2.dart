import 'package:flutter/material.dart';
import 'package:okapia_app/pages/colors.dart';
import 'package:okapia_app/pages/welcome/welcome_widget.dart';

class WelcomeStep2 extends StatelessWidget{
  final VoidCallback onNext;

  const WelcomeStep2({Key key, this.onNext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  child: GestureDetector(
                    onTap: onNext,
                    child: Text(
                      "下一步",
                      style: TextStyle(fontSize: 18, color: PageColors.grey1),
                    ),
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