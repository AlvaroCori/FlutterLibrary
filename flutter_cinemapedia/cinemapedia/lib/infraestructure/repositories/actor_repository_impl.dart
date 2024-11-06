import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';

class ActorRepositoryImpl extends ActorsDatasource {
  final ActorsDatasource datasource;
  ActorRepositoryImpl({required this.datasource});
  @override
  Future<List<Actor>> getActorByMovie(String movieId) {
    return datasource.getActorByMovie(movieId);
  }
}