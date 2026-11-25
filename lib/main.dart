import 'package:flutter/material.dart';

import 'package:movies/src/providers/peliculas_provider.dart';
import 'package:movies/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (!PeliculasProvider.tieneApiKey) {
      return MaterialApp(
        title: 'Películas App',
        debugShowCheckedModeBanner: false,
        home: _FaltaApiKeyPage(),
      );
    }

    return MaterialApp(
      title: 'Películas App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: getApplicationRoutes(),
    );
  }
}

class _FaltaApiKeyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Text(
            'Falta la API key de TMDB.\n\n'
            'Ejecuta la app con:\n'
            'flutter run --dart-define=TMDB_API_KEY=tu_api_key',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
