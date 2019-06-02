import 'package:okapia_app/base/base_bloc.dart';
import 'package:okapia_app/database/repository.dart';
import 'package:okapia_app/database/repository_provider.dart';
import 'package:okapia_app/entities/record.dart';

class UserPwdBloc extends BaseBloc {
  final RecordRepository recordRepository =
      RepositoryProvider.getRecordRepository();

  Future savePwd(String title, String password) async {
    return await recordRepository
        .create(new RecordEntity(title: title, content: password));
  }

  @override
  void dispose() {}
}
