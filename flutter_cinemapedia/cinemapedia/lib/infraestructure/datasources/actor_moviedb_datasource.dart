import 'package:cinemapedia/config/constants/enviroment.dart';
import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infraestructure/mappers/actor_mapper.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/credits_response.dart';
import 'package:dio/dio.dart';

class ActorMoviedbDatasource extends ActorsDatasource{
  final dio = Dio(BaseOptions(
    baseUrl: "https://api.themoviedb.org/3",
    queryParameters: {
      'api_key': Enviroment.theMovieDBKey,
      'language': "es-MX"
    }
  ));
  @override
  Future<List<Actor>> getActorByMovie(String movieId) async{
    final response = await dio.get(
      "/movie/$movieId/credits"
    );
    final castResponse = CreditsResponse.fromJson(response.data);
    List<Actor> actors = castResponse.cast.map( (c) => ActorMapper.actorToEntity(c)).toList();
    return actors;
  }

}