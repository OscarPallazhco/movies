import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:movies/src/models/pelicula_model.dart';

class PeliculasProvider {
  String _dominio = "api.themoviedb.org";
  String _apiKey = "6e665b5d83b3e30bc06a1fa03676617e";
  String _language = "es-ES";

  int _enCinesPage = 0;
  int _popularesPage = 0;

  List<Pelicula> _populares = new List();

  final StreamController _popularesStreamController = new StreamController<List<Pelicula>>.broadcast();

  Function(List<Pelicula>) get popularesSink => _popularesStreamController.sink.add;

  Stream<List<Pelicula>> get popularesStream => _popularesStreamController.stream;


  void disposeStreams(){
    _popularesStreamController?.close();
  }

  Future<List<Pelicula>> _procesarRespuesta(Uri url) async {
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final peliculas = new Peliculas.fromJsonList(decodedData["results"]);

    return peliculas.items;
  }

  Future<List<Pelicula>> getEnCines() async {
    _enCinesPage++;
    final url = Uri.https(_dominio, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
      'page': _enCinesPage.toString(),
    });

    final resp = await _procesarRespuesta(url);

    return resp;
  }

  Future<List<Pelicula>> getPopulares() async {
    _popularesPage++;
    final url = Uri.https(_dominio, '3/movie/popular', {
      'api_key': _apiKey,
      'language': _language,
      'page': _popularesPage.toString(),
    });

    final resp = await _procesarRespuesta(url);

    _populares.addAll(resp);
    popularesSink(_populares);

    return resp;
    
  }
}
