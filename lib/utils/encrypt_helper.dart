import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:okapia_app/models/meta_data.dart';
import 'package:uuid/uuid.dart';

class EncryptHelper {
  static var instance = EncryptHelper();

  static var _uuid = new Uuid();

  static String generateSeed() {
    return _uuid.v4().replaceAll("-", "");
  }

  static MetaData create() {
    return MetaData(
      version: "0.0.1",
      transformSeed: generateSeed(),
      masterSeed: generateSeed(),
      iv: generateSeed(),
    );
  }

  ///获取 hash
  String hashMainPwd(String inputKey, String seed) {
    //Step 1, PBKDF2
    var hmackKey = applyPBKDF2(inputKey, seed);
    //Step 2,
    var hashKey = applySha256(hmackKey, seed);
    return hashKey;
  }

  static String applyPBKDF2(String inputKey, String salt) {
    //TODO:
    return inputKey + salt;
//    return Password.hash(inputKey, PBKDF2(
//        salt: salt
//    ));
  }

  static String applySha256(String content, String seed) {
    var saltBytes = utf8.encode(seed);
    var contentBytes = utf8.encode(content);

    var digest = Hmac(sha256, saltBytes).convert(contentBytes);
    return digest.toString();
  }
}
