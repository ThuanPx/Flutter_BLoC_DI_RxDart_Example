import 'dart:async';
import 'package:dio/dio.dart';
import '../models/item_model.dart';
import '../models/trailer_model.dart';
import 'package:inject/inject.dart';
import '../ultis/constants.dart';

class MovieApiProvider {
  final Dio client;

  @provide
  MovieApiProvider(this.client);

  Future<ItemModel> fetchMovieList() async {
    Response response;
    if(API_KEY != 'api-key') {
      response = await client.get("$BASE_URL/popular?api_key=$API_KEY");
    }else{
      throw Exception('Please add your API key');
    }
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      print(response.data);
      return ItemModel.fromJson(response.data);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<TrailerModel> fetchTrailer(int movieId) async {
    final response =
        await client.get("$BASE_URL/$movieId/videos?api_key=$API_KEY");
    if (response.statusCode == 200) {
      return TrailerModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load trailers');
    }
  }
}