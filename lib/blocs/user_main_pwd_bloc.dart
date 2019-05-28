import 'dart:typed_data';

import 'package:encryptions/encryptions.dart';
import 'package:encryptions/hex.dart';
import 'package:okapia_app/base/base_bloc.dart';
import 'package:okapia_app/common/log_utils.dart';
import 'package:okapia_app/database/database_storage.dart';
import 'package:okapia_app/database/db_constant.dart';
import 'package:okapia_app/database/repository.dart';
import 'package:okapia_app/database/repository_provider.dart';
import 'package:okapia_app/database/resource_db_provider.dart';
import 'package:okapia_app/database/storage.dart';
import 'package:okapia_app/models/meta_data.dart';
import 'package:okapia_app/utils/encrypt_helper.dart';
import 'package:okapia_app/entities/config.dart';
import 'package:okapia_app/entities/resource.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

class UserMainPwdBloc extends BaseBloc {
  static final TAG = "UserInfoBloc";

  String _encryptKey;

  var resourceDb = ResourceDBProvider();

  final _uuid = Uuid();

  final Storage<Database> storage;
  final Repository resourceRepository;

  UserMainPwdBloc()
      : storage = RepositoryProvider.storage,
        resourceRepository = RepositoryProvider.getResourceRepository() {}

  /// Check if has set main password
  Future<bool> hasSetMainPwd() async {
    var hash = await _getPwdHash();
    return hash != null && hash.isNotEmpty;
  }

  /// Check if main pwd
  Future<bool> checkMainPwd(String mainPwd) async {
    try {
      var hash = await _generateHashByPwd(mainPwd);
      var storedHash = await _getPwdHash();
      if (storedHash != null && storedHash.isNotEmpty && hash == storedHash) {
        await _generateEncryptKey(mainPwd);
        return true;
      }
      return false;
    } catch (e) {
      LogUtils.error("${TAG}, Get main pwd failed!", e);
      return false;
    }
  }

  /// Set user main pwd
  Future<bool> setMainPwd(String mainPwd) async {
    try {
      await storage.initialize();
      final MetaData meta = EncryptHelper.create();
      var saved = await resourceRepository.batchCreate(meta.toEntities());
//      var hash = await _generateHashByPwd(mainPwd);
//      await _savePwdHash(hash);
//      await _generateEncryptKey(mainPwd);
      return true;
    } on Exception catch (e) {
      LogUtils.error("${TAG}, setMainPwd pwd failed!", e);
      return false;
    }
  }

  String getEncryptKey() => _encryptKey;

  Future<bool> _generateEncryptKey(String mainPwd) async {
    var seed2 = await _fetchSeed2();
    _encryptKey = EncryptHelper.applyPBKDF2(mainPwd, seed2);
    return true;
  }

  Future<String> _generateHashByPwd(String mainPwd) async {
    var seed1 = await _fetchSeed1();

    var hmacKey = EncryptHelper.applyPBKDF2(mainPwd, seed1);
    var hash = EncryptHelper.applySha256(hmacKey, seed1);
    return hash;
  }

  Future<bool> _savePwdHash(String pwdHash) async {
    var hashResource =
        await resourceDb.getResourceByName(RESOURCE_MAIN_PWD_HASH) ??
            Resource(name: RESOURCE_MAIN_PWD_HASH);
    hashResource.value = pwdHash;
    await resourceDb.saveOrUpdate(hashResource);
    return true;
  }

  Future<String> _getPwdHash() async {
    var hashResource =
        await resourceDb.getResourceByName(RESOURCE_MAIN_PWD_HASH);
    return hashResource?.value;
  }

  Future<String> _fetchSeed1() async {
    var seedResource =
        await resourceDb.getResourceByName(RESOURCE_MAIN_PWD_SEED1);
    if (seedResource == null) {
      seedResource = Resource(name: RESOURCE_MAIN_PWD_SEED1, value: _uuid.v4());
      resourceDb.insertResource(seedResource);
    }
    return seedResource.value;
  }

  Future<String> _fetchSeed2() async {
    var seedResource =
        await resourceDb.getResourceByName(RESOURCE_MAIN_PWD_SEED2);
    if (seedResource == null) {
      seedResource = Resource(name: RESOURCE_MAIN_PWD_SEED2, value: _uuid.v4());
      resourceDb.insertResource(seedResource);
    }
    return seedResource.value;
  }

  @override
  void dispose() {}
}
