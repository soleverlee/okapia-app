import 'package:okapia_app/base/base_bloc.dart';
import 'package:okapia_app/common/log_utils.dart';
import 'package:okapia_app/database/repository.dart';
import 'package:okapia_app/database/repository_provider.dart';
import 'package:okapia_app/database/storage.dart';
import 'package:okapia_app/models/meta_data.dart';
import 'package:okapia_app/utils/encrypt_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

class UserMainPwdBloc extends BaseBloc {
  static final TAG = "UserInfoBloc";

  String _encryptKey;

  final _uuid = Uuid();

  final Storage<Database> storage;
  final Repository resourceRepository;

  ///TODO: use db later
  String _mainPwd;

  UserMainPwdBloc()
      : storage = RepositoryProvider.storage,
        resourceRepository = RepositoryProvider.getConfigRepository();

  /// Check if main pwd
  Future<bool> checkMainPwd(String mainPwd) async {
    try {
      ///TODO: fix later
      return mainPwd == _mainPwd;
//      var hash = await _generateHashByPwd(mainPwd);
//      var storedHash = await _getPwdHash();
//      if (storedHash != null && storedHash.isNotEmpty && hash == storedHash) {
//        //await _generateEncryptKey(mainPwd);
//        return true;
//      }
//      return false;
    } catch (e) {
      LogUtils.error("${TAG}, Get main pwd failed!", e);
      return false;
    }
  }

  /// Set user main pwd
  Future<bool> setMainPwd(String mainPwd) async {
    try {
      ///TODO: fix later
      _mainPwd = mainPwd;
      return true;

//      await storage.initialize();
//      final MetaData meta = EncryptHelper.create();
//      var saved = await resourceRepository.batchCreate(meta.toEntities());
//      var hash = await _generateHashByPwd(mainPwd);
//      await _savePwdHash(hash);
//      await _generateEncryptKey(mainPwd);
//      return true;
    } on Exception catch (e) {
      print(e);
      LogUtils.error("${TAG}, setMainPwd pwd failed!", e);
      return false;
    }
  }

  Future<bool> hasMainPwd() async {
    return _mainPwd != null;
  }

  Future<void> clearMainPwd() async {
    _mainPwd = null;
  }


  String getEncryptKey() => _encryptKey;

  @override
  void dispose() {}
}
