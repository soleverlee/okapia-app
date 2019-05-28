import 'package:okapia_app/base/base_bloc.dart';
import 'package:okapia_app/database/repository.dart';
import 'package:okapia_app/database/repository_provider.dart';
import 'package:okapia_app/entities/record.dart';
import 'package:okapia_app/models/record_view.dart';
import 'package:okapia_app/models/search_view.dart';
import 'package:rxdart/rxdart.dart';

class RecordBloc extends BaseBloc {
  BehaviorSubject<String> encryptKeyController = BehaviorSubject();
  BehaviorSubject<RecordView> recordViewController = BehaviorSubject();
  BehaviorSubject<SearchView> searchPageController = BehaviorSubject();

  final RecordRepository recordRepository =
      RepositoryProvider.getRecordRepository();

  RecordBloc() {
    recordViewController.value =
        RecordView(count: 0, list: List(), isLoaded: false);
    searchPageController.value = SearchView(
      historyList: List(),
      recordView: RecordView(count: 0, list: List(), isLoaded: true),
    );
  }

  _convertEntitiesToView(List<RecordEntity> recordList) {
    return RecordView(
      count: recordList.length,
      list: recordList,
      isLoaded: true,
    );
  }

  doQueryRecordList() async {
    List<RecordEntity> recordList = await recordRepository.findAll();
    recordViewController.value = _convertEntitiesToView(recordList);
  }

  doQueryRecordListByTitle(String title) async {
    searchPageController.value.recordView.isLoaded = false;
    List<RecordEntity> recordList = await recordRepository.findByTitle(title);
    searchPageController.value.recordView = _convertEntitiesToView(recordList);
  }

  updateHistoryList(String keyword) async {
    List<String> historyList = searchPageController.value.historyList;
    if (historyList.indexOf(keyword) == -1) {
      int keywordCount = historyList.length;
      if (keywordCount > 5) {
        historyList.removeAt(0);
      }
      historyList.add(keyword);
    }
    searchPageController.value.historyList = historyList;
  }

  @override
  void dispose() {
    encryptKeyController.close();
    recordViewController.close();
    searchPageController.close();
  }
}
