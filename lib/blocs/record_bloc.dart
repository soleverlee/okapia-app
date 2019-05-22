import 'package:okapia_app/apis/apis.dart';
import 'package:okapia_app/base/base_bloc.dart';
import 'package:okapia_app/database/resource_db_provider.dart';
import 'package:okapia_app/models/record_view.dart';
import 'package:rxdart/rxdart.dart';

class RecordBloc extends BaseBloc {
  BehaviorSubject<String> encryptKeyController = BehaviorSubject();
  BehaviorSubject<RecordView> recordViewController = BehaviorSubject();
  BehaviorSubject<RecordView> searchPageController = BehaviorSubject();

  var resourceDb = ResourceDBProvider();

  RecordBloc() {
    recordViewController.value =
        RecordView(count: 0, list: List(), isLoaded: false);
    searchPageController.value =
        RecordView(count: 0, list: List(), isLoaded: true);
  }

  doQueryRecordList() async {
    RecordView recordView = await Apis.getRecordList();
    recordViewController.value = recordView;
  }

  doQueryRecordListByTitle(String title) async {
    searchPageController.value.isLoaded = false;
    RecordView recordView = await Apis.getRecordListByTitle(title);
    print("recordView");
    print(recordView);
    print(searchPageController.value.isLoaded);
    searchPageController.value = recordView;
    print(searchPageController.value.isLoaded);
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
