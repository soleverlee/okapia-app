import 'package:flutter/material.dart';
import 'package:okapia_app/base/base_bloc.dart';
import 'package:okapia_app/blocs/user_main_pwd_bloc.dart';
import 'package:okapia_app/common/toast_utils.dart';
import 'package:okapia_app/common/utils.dart';
import 'package:okapia_app/pages/colors.dart';
import 'package:okapia_app/pages/welcome/welcome_widget.dart';
import 'package:okapia_app/common/password_validator.dart';

class WelcomeStep2 extends StatefulWidget {
  final VoidCallback onNext;

  const WelcomeStep2({Key key, this.onNext}) : super(key: key);

  @override
  _WelcomeStep2State createState() => _WelcomeStep2State();
}

class _WelcomeStep2State extends State<WelcomeStep2> {
  TextEditingController controller1;
  TextEditingController controller2;

  String errorMsg1;
  String errorMsg2;

  final focus2 = FocusNode();

  @override
  void initState() {
    controller1 = TextEditingController();
    controller2 = TextEditingController();
    super.initState();
  }

  void _clickNext() async {
    Utils.hideKeyboard(context);
    var pwd1 = controller1.text;
    var errorMsg1 = _checkMainPwdSuitable(pwd1);
    if (errorMsg1 != null) {
      setState(() {
        this.errorMsg1 = errorMsg1;
      });
      return;
    } else {
      setState(() {
        this.errorMsg1 = null;
      });
    }
    var pwd2 = controller2.text;
    if (pwd1 != pwd2) {
      setState(() {
        this.errorMsg2 = "两次输入的密码不一致";
      });
      return;
    } else {
      setState(() {
        this.errorMsg2 = null;
      });
    }
    //Store to db
    var pwdBloc = BlocProvider.of<UserMainPwdBloc>(context);
    var result = await pwdBloc.setMainPwd(pwd1);
    if (!result) {
      ToastUtils.showError(context, "设置密码失败!");
      return;
    }
    this.widget.onNext.call();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(
            left: WelcomeWidgetStyle.LEFT_MARGIN,
            right: WelcomeWidgetStyle.RIGHT_MARGIN),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
                "主密码是您保存其他密码的唯一凭证，请牢记这个密码并不要泄露给任何人。我们不会存储您的主密码，这也意味着当您忘记主密码时将没有任何办法可以恢复",
                style: WelcomeWidgetStyle.SubTextStyle),
            Padding(
              padding: const EdgeInsets.only(top: 0, bottom: 0),
              child: Center(
                child: Image(
                  height: 220,
                  width: 250,
                  image: AssetImage("assets/welcome_step2_bg.png"),
                ),
              ),
            ),
            Center(
                child: _PasswordText(
              controller: controller1,
              onTap: () {
                setState(() {
                  errorMsg1 = null;
                });
              },
              errorMsg: errorMsg1,
              hint: "请输入主密码",
              onSubmit: () {
                FocusScope.of(context).requestFocus(focus2);
              },
            )),
            _PasswordText(
              controller: controller2,
              onTap: () {
                setState(() {
                  errorMsg2 = null;
                });
              },
              errorMsg: errorMsg2,
              hint: "请重复主密码",
              focusNode: focus2,
              onSubmit: () {
                _clickNext();
              },
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      top: 50, bottom: 50),
                  child: GestureDetector(
                    onTap: () {
                      _clickNext();
                    },
                    child: Text(
                      "下一步",
                      style: TextStyle(fontSize: 18, color: PageColors.grey1),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _PasswordText extends StatelessWidget {
  final TextEditingController controller;
  final String errorMsg;
  final VoidCallback onTap;
  final bool errorState;
  final String hint;
  final VoidCallback onSubmit;
  final FocusNode focusNode;

  const _PasswordText(
      {Key key,
      this.errorMsg,
      this.onTap,
      this.errorState,
      this.controller,
      this.hint,
      this.onSubmit,
      this.focusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context)
          .copyWith(primaryColor: Colors.red, hintColor: PageColors.grey2),
      child: TextField(
        controller: controller,
        onTap: onTap,
        focusNode: focusNode,
        textInputAction: TextInputAction.next,
        onSubmitted: (value) {
          onSubmit?.call();
        },
        scrollPadding: const EdgeInsets.only(bottom: 120),
        maxLines: 1,
        obscureText: true,
        decoration: InputDecoration(
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: PageColors.orange1)),
            errorText: errorMsg,
            hintText: hint,
            hintStyle: TextStyle(fontSize: 14)),
      ),
    );
  }
}

String _checkMainPwdSuitable(String mainPwd) {
  PasswordValidator passwordValidator = new PasswordValidator(mainPwd);
  if (!passwordValidator.isPasswordStrong()) return passwordValidator.error;
  return null;
}
