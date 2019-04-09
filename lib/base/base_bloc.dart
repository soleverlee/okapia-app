import 'package:flutter/material.dart';
import 'package:okapia_app/base/app_bloc.dart';

abstract class Disposable {
  void dispose();
}

abstract class BaseBloc implements Disposable {}

class BlocProvider<T extends BaseBloc> extends StatefulWidget {
  BlocProvider({
    Key key,
    @required this.child,
    @required this.bloc,
  }) : super(key: key);

  final T bloc;
  final Widget child;

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();

  static T of<T extends BaseBloc>(BuildContext context) {
    final type = _typeOf<BlocProvider<T>>();
    BlocProvider<T> provider = context.ancestorWidgetOfExactType(type);

    if (provider != null) {
      return provider.bloc;
    }

    ///找不到provider就从app bloc 里找
    final appBlocType = _typeOf<BlocProvider<AppBloc>>();
    BlocProvider<AppBloc> appBlocProvider =
        context.ancestorWidgetOfExactType(appBlocType);
    return appBlocProvider.bloc.find<T>();
  }

  static Type _typeOf<T>() => T;
}

class _BlocProviderState<T> extends State<BlocProvider<BaseBloc>> {
  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
