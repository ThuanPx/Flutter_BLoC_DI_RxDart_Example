import 'package:blocexample/src/models/item_model.dart';
import 'package:blocexample/src/models/trailer_model.dart';
import 'package:blocexample/src/resources/movie_api_provider.dart';

class Repository {
  final moviesApiProvider = MovieApiProvide();

  Future<ItemModel> fetchAllMovies() => moviesApiProvider.fetchMovieList();

  Future<TrailerModel> fetchTrainer(int movieId) => moviesApiProvider.fetchTrailer(movieId);  
}