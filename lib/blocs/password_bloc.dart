import 'package:okapia_app/apis/apis.dart';
import 'package:okapia_app/base/base_bloc.dart';
import 'package:okapia_app/database/resource_db_provider.dart';
import 'package:okapia_app/models/passwords.dart';
import 'package:rxdart/rxdart.dart';

class PasswordBloc extends BaseBloc {

  BehaviorSubject<String> encryptKeyController = BehaviorSubject();
  BehaviorSubject<Passwords> passwordsController = BehaviorSubject();

  var resourceDb = ResourceDBProvider();

  PasswordBloc() {
    passwordsController.value =
        Passwords(count: 0, list: List(), isLoaded: false);
  }

  doQueryPasswordList() async {
    Passwords passwords = await Apis.getPasswordList();
    passwordsController.value = passwords;
  }


  bool checkHashEncryptKey() {

  }

//  String saveEncryptKey(String encryptKey){
//    resourceDb.
//    ResourceDBProvider.database;
//  }


  @override
  void dispose() {
    encryptKeyController.close();
    passwordsController.close();
  }
}