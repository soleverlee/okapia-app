import 'package:flutter_test/flutter_test.dart';
import 'package:okapia_app/encrypt/encrypt_helper.dart';

void main() {
  testWidgets('test applyPBKDF2', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    var pwd = "1234567";
    var seed = "7777777777";
    var pbkdf2Value = EncryptHelper.instance.applyPBKDF2(pwd, seed);

    print(pbkdf2Value);
  });
}