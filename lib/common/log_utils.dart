class LogUtils {
  static i(String message) {
    print(message);
  }

  static e(dynamic e) {
    print("exception:$e");
  }

  static error(String message, dynamic ex) {
    print("error:${message},  exception:$e");
  }
}
