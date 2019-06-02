import 'package:okapia_app/base/base_bloc.dart';
import 'package:okapia_app/database/record_db_provider.dart';
import 'package:okapia_app/entities/record.dart';

class UserPwdBloc extends BaseBloc {
  RecordDBProvider recordDBProvider = RecordDBProvider();

  Future savePwd(String title, String password) async {
    return await recordDBProvider
        .rawInsertRecord(new RecordEntity(title: title, content: password));

  }

  @override
  void dispose() {}
}
