import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/credits_response.dart';

class ActorMapper{
  static Actor actorToEntity(Cast cast){
    return  Actor(
      id: cast.id, 
      name: cast.name, 
      profilePath: cast.profilePath != null?  "https://image.tmdb.org/t/p/w500${ cast.profilePath }" :"https://sd.keepcalms.com/i-w600/keep-calm-poster-not-found.jpg", 
      character: cast.character ?? ""
    );
    
  }
  
}