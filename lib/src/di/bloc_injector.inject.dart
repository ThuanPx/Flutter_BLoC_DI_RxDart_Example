import 'bloc_injector.dart' as _i1;
import 'bloc_module.dart' as _i2;
import 'network_module.dart' as _i3;
import 'package:dio/src/dio.dart' as _i4;
import '../resources/movie_api_provider.dart' as _i5;
import '../resources/repository.dart' as _i6;
import 'dart:async' as _i7;
import '../app.dart' as _i8;
import '../blocs/movies_bloc.dart' as _i9;
import '../blocs/movie_detail_bloc.dart' as _i10;

class BlocInjector$Injector implements _i1.BlocInjector {
  BlocInjector$Injector._(this._blocModule, this._netWorkModule);

  final _i2.BlocModule _blocModule;

  final _i3.NetWorkModule _netWorkModule;

  _i4.Dio _singletonDio;

  _i5.MovieApiProvider _singletonMovieApiProvider;

  _i6.Repository _singletonRepository;

  static _i7.Future<_i1.BlocInjector> create(
      _i2.BlocModule blocModule, _i3.NetWorkModule netWorkModule) async {
    final injector = BlocInjector$Injector._(blocModule, netWorkModule);

    return injector;
  }

  _i8.App _createApp() =>
      _i8.App(_createMoviesBloc(), _createMovieDetailBloc());
  _i9.MoviesBloc _createMoviesBloc() => _i9.MoviesBloc(_createRepository());
  _i6.Repository _createRepository() => _singletonRepository ??=
      _blocModule.repository(_createMovieApiProvider());
  _i5.MovieApiProvider _createMovieApiProvider() =>
      _singletonMovieApiProvider ??= _blocModule.movieApiProvider(_createDio());
  _i4.Dio _createDio() => _singletonDio ??= _netWorkModule.dio();
  _i10.MovieDetailBloc _createMovieDetailBloc() =>
      _i10.MovieDetailBloc(_createRepository());
  @override
  _i8.App get app => _createApp();
}
