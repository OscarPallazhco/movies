import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:movies/src/models/pelicula_model.dart';

class PeliculasProvider {
  String _dominio = "api.themoviedb.org";
  String _apiKey = "6e665b5d83b3e30bc06a1fa03676617e";
  String _language = "es-ES";

  Future<List<Pelicula>> getEnCines() async {
    final url = Uri.https(_dominio, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
    });

    final resp = await http.get(url);

    final decodedData = json.decode(resp.body);

    final peliculas = new Peliculas.fromJsonList(decodedData["results"]);

    return peliculas.items;
  }
}
