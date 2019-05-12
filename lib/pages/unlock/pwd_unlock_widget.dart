import 'package:flutter/material.dart';

import '../colors.dart';

class PwdUnlockWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: PageColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image(
            width: 201,
            height: 198,
            image: AssetImage("assets/unlock_pwd_icon.png"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _PasswordText(),
          )
        ],
      ),
    ));
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
