import 'package:okapia_app/base/base_bloc.dart';
import 'package:okapia_app/database/repository.dart';
import 'package:okapia_app/database/repository_provider.dart';
import 'package:okapia_app/entities/record.dart';

class CreateRecordBloc extends BaseBloc {
  final RecordRepository recordRepository =
      RepositoryProvider.getRecordRepository();

  Future<RecordEntity> doCreate(String title, String password) async {
    return await recordRepository
        .create(RecordEntity(title: title, content: password));
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
