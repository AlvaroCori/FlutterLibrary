import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroment {
  static String theMovieDBKey = dotenv.env["THE_MOVIEDB_KEY"] ?? "api key doesn't exist";
}