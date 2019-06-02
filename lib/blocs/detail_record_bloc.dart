import 'package:okapia_app/base/base_bloc.dart';
import 'package:okapia_app/database/repository.dart';
import 'package:okapia_app/database/repository_provider.dart';
import 'package:okapia_app/entities/record.dart';

class DetailRecordBloc extends BaseBloc {
  final RecordRepository recordRepository =
      RepositoryProvider.getRecordRepository();

  Future<RecordEntity> getRecordById(int id) async {
    return recordRepository.findById(id);
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
