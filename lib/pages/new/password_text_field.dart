import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PasswordTextField extends StatefulWidget {
  final String hint;
  final TextEditingController controller;

  PasswordTextField({this.controller, this.hint});

  @override
  State<StatefulWidget> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _showPassword = false;

  void _toggleShowPassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            controller: widget.controller,
            maxLines: 1,
            scrollPadding: EdgeInsets.all(0),
            style: TextStyle(
              color: Color(0xFF888888),
              fontSize: 16,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              hintText: widget.hint,
              fillColor: Color(0xFF888888),
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
            obscureText: !_showPassword,
          ),
        ),
        GestureDetector(
            onTap: _toggleShowPassword, child: Icon(Icons.remove_red_eye))
      ],
    );
  }
}
