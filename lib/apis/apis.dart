import 'package:okapia_app/database/record_db_provider.dart';
import 'package:okapia_app/entities/record.dart';
import 'package:okapia_app/models/record_view.dart';

class Apis {
  static RecordDBProvider recordDBProvider = RecordDBProvider();

  static Future<RecordView> getRecordList() async {
    List<RecordEntity> recordList =
    await recordDBProvider.getAllRecords();
    return RecordView(
        count: recordList.length, list: recordList, isLoaded: true);
  }

  static Future<RecordView> getRecordListByTitle(String title) async {
    List<RecordEntity> recordList =
    await recordDBProvider.getRecordsByTitle(title);
    return RecordView(
        count: recordList.length, list: recordList, isLoaded: true);
  }
}
