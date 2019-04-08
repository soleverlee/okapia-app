import 'package:okapia_app/base/base_bloc.dart';


/// 存放一些全局存储的数据

class AppBloc implements BaseBloc {

  List<BaseBloc> blocs = [];

  AppBloc(){
    /// 初始化工作
  }

  T find<T extends BaseBloc>() {
    return blocs.firstWhere((it)=>it is T);
  }

  @override
  void dispose(){
    blocs.forEach((it)=>it.dispose());
  }
}