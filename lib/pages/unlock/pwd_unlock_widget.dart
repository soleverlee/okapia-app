import 'package:flutter/material.dart';
import 'package:okapia_app/base/base_bloc.dart';
import 'package:okapia_app/blocs/user_main_pwd_bloc.dart';
import 'package:okapia_app/common/constants.dart';
import 'package:okapia_app/routers.dart';

import '../colors.dart';

const _StringPwdTipError = "密码验证失败，请重新输入";

class PwdUnlockWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: PageColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 70,
          ),
          GestureDetector(
            onLongPress: (){
              if (isDebug) {
                Routers.gotoDebug(context);
              }
            },
            child: Image(
              width: 201,
              height: 198,
              image: AssetImage("assets/unlock_pwd_icon.png"),
            ),
          ),
          Container(
            height: 35,
          ),
          _UnlockByPwdWidget(),
        ],
      ),
    ));
  }
}


class _UnlockByPwdWidget extends StatefulWidget{
  @override
  __UnlockByPwdWidgetState createState() => __UnlockByPwdWidgetState();
}

class __UnlockByPwdWidgetState extends State<_UnlockByPwdWidget> {

  TextEditingController _pwdController;
  String _errorMsg;

  void _doUnlock() async{
    var pwd = _pwdController.text;
    var pwdBloc = BlocProvider.of<UserMainPwdBloc>(context);
    var result = await pwdBloc.checkMainPwd(pwd);
    if (!result) {
      setState(() {
        _errorMsg = _StringPwdTipError;
      });
      return;
    }
    Routers.gotoHomePage(this.context);
  }

  @override
  void initState() {
    _pwdController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 55,right: 55),
      child: Row(
        children: <Widget>[
          Expanded(
            child: _PasswordText(
              controller: _pwdController,
              hint: "输入您的主密码以解锁",
              errorMsg: _errorMsg,
              onSubmit: _doUnlock,
            ),
          ),
          GestureDetector(
              onTap: _doUnlock,
              child: Icon(Icons.lock, color: PageColors.orange1))
        ],
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

  const _PasswordText(
      {Key key,
        this.errorMsg,
        this.onTap,
        this.errorState,
        this.controller,
        this.hint, this.onSubmit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context)
          .copyWith(primaryColor: Colors.red, hintColor: PageColors.grey2),
      child: TextField(
        controller: controller,
        onTap: onTap,
        textInputAction: TextInputAction.done,
        onSubmitted: (value){
          onSubmit?.call();
        },
        maxLines: 1,
        obscureText: true,
        decoration: InputDecoration(
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: PageColors.orange1,)),
            errorText: errorMsg,
            hintText: hint,
            hintStyle: TextStyle(fontSize: 14)),
      ),
    );
  }
}
