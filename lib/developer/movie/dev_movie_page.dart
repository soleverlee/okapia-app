import 'package:flutter/material.dart';
import 'package:okapia_app/base/base_bloc.dart';
import 'package:okapia_app/developer/movie/dev_movie_bloc.dart';
import 'package:okapia_app/developer/movie/dev_movie_models.dart';

class DevMoviePageContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DevMoviePageContainerState();
}

class _DevMoviePageContainerState extends State<DevMoviePageContainer> {
  DevMovieBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = DevMovieBloc();
    _bloc.doQuery();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: _bloc,
      child: _DevMoviePage(),
    );
  }
}

class _DevMoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<DevMovieBloc>(context);
    return Scaffold(
        appBar: AppBar(title: Text("Dev movie page")),
        body: StreamBuilder<DevMovieResponseModel>(
            stream: bloc.moviesController,
            initialData: bloc.moviesController.value,
            builder: (context, snapshot) {
              var itemList = snapshot.data.subjects;
              return ListView.builder(
                  itemCount: itemList.length,
                  itemBuilder: (BuildContext context, int index) {
                var item = itemList[index];
                return _buildItem(context, item);
              });
            }));
  }

  Widget _buildItem(BuildContext context, DevMovieModel item) {
    return Row(
      children: <Widget>[
        Text(item.title ?? ""),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(item.year ?? ""),
        ),
      ],
    );
  }
}
