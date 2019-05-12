
import 'package:okapia_app/base/base_bloc.dart';
import 'package:okapia_app/database/resource_db_provider.dart';

class UserSettingBloc extends BaseBloc{
  var resourceDb = ResourceDBProvider();

  ///For test. Clear all setting
  Future<bool> clearUserMainPwd() async{
    await resourceDb.deleteAllResources();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}