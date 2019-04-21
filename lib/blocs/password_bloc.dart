import 'package:okapia_app/base/base_bloc.dart';
import 'package:okapia_app/database/resource_db_provider.dart';
import 'package:rxdart/rxdart.dart';

class MainPwdBloc extends BaseBloc{

  BehaviorSubject<String> encryptKeyController = BehaviorSubject();

  var resourceDb = ResourceDBProvider();


  bool checkHashEncryptKey(){

  }

//  String saveEncryptKey(String encryptKey){
//    resourceDb.
//    ResourceDBProvider.database;
//  }


  @override
  void dispose() {
    encryptKeyController.close();
  }

}