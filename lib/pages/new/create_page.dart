import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:okapia_app/pages/new/password_text_field.dart';

const edgeHorizontal = 16.0;
const colorWarningText = Color(0xFFE51C23);

class CreatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  var _shouldShowErrorTips = false;
  var _sholdShowLoading = false;
  var _titleEditingController = TextEditingController();
  var _catalogEditingController = TextEditingController();
  var _passwordEditingController = TextEditingController();
  var _passwordConfirmEditingController = TextEditingController();

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "创建新密码",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Color(0xFFF4F4F4),
        constraints: BoxConstraints.expand(),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                _buildInputContent(),
                Offstage(
                  offstage: !_shouldShowErrorTips,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(
                        edgeHorizontal, 10, edgeHorizontal, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "两次输入的密码信息不一致",
                      style: TextStyle(color: colorWarningText),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 60,
              height: 40,
              left: 40,
              right: 40,
              child: FlatButton(
                onPressed: _clickSaveButton,
                textColor: Colors.white,
                child: Text("保存密码"),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.green,
                highlightColor: Colors.green[900],
              ),
            ),
            Offstage(
              offstage: !_sholdShowLoading,
              child: Container(
                color: Color(0x99ffffff),
                constraints: BoxConstraints.expand(),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      CircularProgressIndicator(),
                      SizedBox(height: 30),
                      Text("正在保存中...")
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputContent() {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildDivider(),
          _itemWidget(
            child: Row(
              children: <Widget>[
                _buildItemTitleText("标题"),
                Expanded(
                    child: _buildTextField(
                        controller: _titleEditingController, hintText: "请输入标题"))
              ],
            ),
          ),
          _buildDivider(),
          _itemWidget(
            child: Row(children: <Widget>[
              _buildItemTitleText("分类"),
              Expanded(
                child: _buildTextField(
                    controller: _catalogEditingController, hintText: "默认分类"),
              ),
              Icon(Icons.keyboard_arrow_right),
            ]),
          ),
          _buildDivider(),
          _itemWidget(
            child: Row(
              children: <Widget>[
                _buildItemTitleText("密码"),
                Expanded(
                    child: PasswordTextField(
                        controller: _passwordEditingController,
                        hint: "请在此输入您的密码")),
              ],
            ),
          ),
          _buildDivider(),
          _itemWidget(
            child: Row(
              children: <Widget>[
                _buildItemTitleText("确认"),
                Expanded(
                  child: PasswordTextField(
                    controller: _passwordConfirmEditingController,
                    hint: "确认您输入的密码",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemTitleText(String text) {
    return Text(
      text,
      style: TextStyle(color: Colors.black, fontSize: 16),
    );
  }

  Widget _buildTextField(
      {TextEditingController controller, String hintText = ""}) {
    return TextField(
      controller: controller,
      maxLines: 1,
      scrollPadding: EdgeInsets.all(0),
      style: TextStyle(
        color: Color(0xFF888888),
        fontSize: 16,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        hintText: hintText,
        fillColor: Color(0xFF888888),
        border: OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(height: 1, color: Color(0xFFD5D5D5));
  }

  void _clickSaveButton() {
    var title = _titleEditingController.text;
    var catalog = _catalogEditingController.text;
    var password = _passwordEditingController.text;
    var passwordConfirm = _passwordConfirmEditingController.text;

    var isSamePassword = password == passwordConfirm;
    print(
        ">>>> _clickSaveButtonm; title:$title, catalog:$catalog, password:$password, passwordConfirm:$passwordConfirm, isSamePassword:${isSamePassword}");
    _showPasswordErrorTipsOrNot(!isSamePassword);
    if (!isSamePassword) {
      return;
    }

    _save();
  }

  void _save() {
    _showLoadingOrNot(true);

    Future.delayed(const Duration(milliseconds: 2000), () {
      _showLoadingOrNot(false);
    });
  }

  void _showPasswordErrorTipsOrNot(bool shouldShow) {
    setState(() {
      _shouldShowErrorTips = shouldShow;
    });
  }

  void _showLoadingOrNot(bool show) {
    setState(() {
      _sholdShowLoading = show;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _titleEditingController.dispose();
    _catalogEditingController.dispose();
    _passwordEditingController.dispose();
    _passwordConfirmEditingController.dispose();
  }

  Widget _itemWidget({Widget child}) {
    return Container(
      alignment: Alignment.center,
      height: 48,
      padding: EdgeInsets.fromLTRB(edgeHorizontal, 0, edgeHorizontal, 0),
      child: child,
    );
  }
}
