import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:uuid/uuid.dart';

import 'package:password/password.dart';

class EncryptHelper{
  static var instance = EncryptHelper();

  var uuid = new Uuid();

  String generateSeed() {
    return uuid.v4();
  }

  ///获取 hash
  String hashMainPwd(String inputKey, String seed) {
    //Step 1, PBKDF2
    var hmackKey =  applyPBKDF2(inputKey, seed);
    //Step 2,
    var hashKey = applySha256(hmackKey, seed);
    return hashKey;
  }

  ///获取 Entrypt key
  String applyPBKDF2(String inputKey, String salt){
    return Password.hash(inputKey, PBKDF2(
        salt: salt
    ));
  }

  String applySha256(String content, String seed) {
    var saltBytes= utf8.encode(seed);
    var contentBytes = utf8.encode(content);

    var digest = Hmac(sha256, saltBytes).convert(contentBytes);
    return digest.toString();
  }
}