import 'package:flutter/material.dart';
import 'package:movies/src/providers/peliculas_provider.dart';

import 'package:movies/src/widgets/card_swiper_widget.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Películas en cines'),
        centerTitle: false,
        backgroundColor: Colors.indigo,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      body: Column(
        children: <Widget>[
          _swiperTarjetas(),
        ],
      ),
    );
  }

  Widget _swiperTarjetas() {

    PeliculasProvider peliculasProvider = new PeliculasProvider();
    peliculasProvider.getEnCines();

    return CardSwiperW(elementos: []);
  }
}
