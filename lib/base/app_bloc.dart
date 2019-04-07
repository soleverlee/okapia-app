import 'package:okapia_app/base/bloc_base.dart';


/// 存放一些全局存储的数据

class AppBloc implements BlocBase {

  List<BlocBase> blocs = [];

  AppBloc(){
    /// 初始化工作
  }

  T find<T extends BlocBase>() {
    return blocs.firstWhere((it)=>it is T);
  }

  @override
  void dispose(){
    blocs.forEach((it)=>it.dispose());
  }
}