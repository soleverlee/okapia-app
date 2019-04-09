import 'package:okapia_app/common/log_utils.dart';
import 'package:package_info/package_info.dart';

const PKG_NAME_DEV = "com.thoughtworks.okapia_app.dev";
const PKG_NAME_QA = "com.thoughtworks.okapia_app.qa";
const PKG_NAME_PROD = "com.thoughtworks.okapia_app";

class DevEnv extends Env {
  @override
  String get baseUrl => "";

  @override
  bool isDev() => true;
}

class QaEnv extends Env {
  @override
  String get baseUrl => "";
}

class ProdEnv extends Env {
  @override
  String get baseUrl => "";
}

class Env {
  String baseUrl;

  bool isDev() {
    return false;
  }

  String get name => runtimeType.toString();

  static Env curEnv;

  static Future<Env> getCurEnv() async {
    if (curEnv != null) {
      return curEnv;
    }
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    if (curEnv != null) {
      return curEnv;
    }
    switch (packageInfo.packageName) {
      case PKG_NAME_DEV:
        curEnv = DevEnv();
        break;
      case PKG_NAME_QA:
        curEnv = QaEnv();
        break;
      case PKG_NAME_PROD:
        curEnv = ProdEnv();
        break;
      default:
        curEnv = ProdEnv();
        break;
    }
    LogUtils.i("Current env is ${curEnv.runtimeType}");
    return curEnv;
  }
}
