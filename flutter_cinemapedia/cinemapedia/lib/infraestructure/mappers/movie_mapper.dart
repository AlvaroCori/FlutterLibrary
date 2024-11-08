import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/movie_details.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/movie_moviedb.dart';

class MovieMapper{
  static Movie movieDBToEntity(MovieMovieDB moviedb){
    return Movie(
      adult: moviedb.adult, 
      backdropPath: moviedb.backdropPath != ""? "https://api.themoviedb.org/t/p/w500${moviedb.backdropPath}" : "https://avatars.mds.yandex.net/i?id=9e2d0bc2370f1b3cc69febf5960fd66fb85b1653-13318493-images-thumbs&n=13", 
      genreIds: moviedb.genreIds.map((e) => e.toString()).toList(), 
      id: moviedb.id, 
      originalLanguage: moviedb.originalLanguage, 
      originalTitle: moviedb.originalTitle, 
      overview: moviedb.overview, 
      popularity: moviedb.popularity, 
      posterPath: moviedb.posterPath != ""? "https://api.themoviedb.org/t/p/w500${moviedb.posterPath}" : "no-poster",  
      releaseDate: moviedb.releaseDate != null? moviedb.releaseDate!: DateTime.now(), 
      title: moviedb.title, 
      video: moviedb.video, 
      voteAverage: moviedb.voteAverage, 
      voteCount: moviedb.voteCount
    );
    
  }
  static Movie movieDetailsToEntity( MovieDetails moviedb ) => Movie(
      adult: moviedb.adult,
      backdropPath: (moviedb.backdropPath != '') 
        ? 'https://image.tmdb.org/t/p/w500${ moviedb.backdropPath }'
        : 'https://sd.keepcalms.com/i-w600/keep-calm-poster-not-found.jpg',
      genreIds: moviedb.genres.map((e) => e.name ).toList(),
      id: moviedb.id,
      originalLanguage: moviedb.originalLanguage,
      originalTitle: moviedb.originalTitle,
      overview: moviedb.overview,
      popularity: moviedb.popularity,
      posterPath: (moviedb.posterPath != '')
        ? 'https://image.tmdb.org/t/p/w500${ moviedb.posterPath }'
        : 'https://sd.keepcalms.com/i-w600/keep-calm-poster-not-found.jpg',
      releaseDate: moviedb.releaseDate,
      title: moviedb.title,
      video: moviedb.video,
      voteAverage: moviedb.voteAverage,
      voteCount: moviedb.voteCount
    );
}