import 'package:okapia_app/apis/apis.dart';
import 'package:okapia_app/base/base_bloc.dart';
import 'package:okapia_app/database/resource_db_provider.dart';
import 'package:okapia_app/models/record_view.dart';
import 'package:okapia_app/models/search_view.dart';
import 'package:rxdart/rxdart.dart';

class RecordBloc extends BaseBloc {
  BehaviorSubject<String> encryptKeyController = BehaviorSubject();
  BehaviorSubject<RecordView> recordViewController = BehaviorSubject();
  BehaviorSubject<SearchView> searchPageController = BehaviorSubject();

  var resourceDb = ResourceDBProvider();

  RecordBloc() {
    recordViewController.value =
        RecordView(count: 0, list: List(), isLoaded: false);
    searchPageController.value = SearchView(
      historyList: List(),
      recordView: RecordView(count: 0, list: List(), isLoaded: true),
    );
  }

  doQueryRecordList() async {
    RecordView recordView = await Apis.getRecordList();
    recordViewController.value = recordView;
  }

  doQueryRecordListByTitle(String title) async {
    searchPageController.value.recordView.isLoaded = false;
    RecordView recordView = await Apis.getRecordListByTitle(title);
    searchPageController.value.recordView = recordView;
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

  bool checkHashEncryptKey() {}

//  String saveEncryptKey(String encryptKey){
//    resourceDb.
//    ResourceDBProvider.database;
//  }

  @override
  void dispose() {
    encryptKeyController.close();
    recordViewController.close();
    searchPageController.close();
  }
}
