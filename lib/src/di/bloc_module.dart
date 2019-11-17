import 'package:dio/dio.dart';
import 'package:inject/inject.dart';
import '../blocs/movies_bloc.dart';
import '../blocs/movie_detail_bloc.dart';
import '../blocs/bloc_base.dart';
import '../resources/repository.dart';
import '../resources/movie_api_provider.dart';

@module
class BlocModule{

  @provide
  @singleton
  MovieApiProvider movieApiProvider(Dio client) => MovieApiProvider(client);

  @provide
  @singleton
  Repository repository(MovieApiProvider movieApiProvider) => Repository(movieApiProvider);

  @provide
  @singleton
  BlocBase movieBloc(Repository repository) => MoviesBloc(repository);

  @provide
  @singleton
  BlocBase movieDetailBloc(Repository repository) => MovieDetailBloc(repository);
}
