import 'package:flutter/material.dart';

import 'package:movies/src/pages/home_page.dart';
import 'package:movies/src/pages/pelicula_detalle_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {

  Map<String, WidgetBuilder> routes = {
    '/' : (BuildContext context) => HomePage(),
    'peliculadetalle' : (BuildContext context) => PeliculaDetallePage(),
  };

  return routes;

}