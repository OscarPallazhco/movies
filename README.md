# Películas App

A Flutter movie browser built on [The Movie Database (TMDB)](https://www.themoviedb.org/) API. It lists movies now in theaters and popular titles, and shows details and cast for each one. The UI is in Spanish (`es-ES`).

<p align="center">
  <img src="docs/screenshots/home.jpg" alt="Home: now playing swiper and popular movies" width="260">
  &nbsp;
  <img src="docs/screenshots/detail.jpg" alt="Movie detail with overview and cast" width="260">
  &nbsp;
  <img src="docs/screenshots/search.jpg" alt="Movie search" width="260">
</p>

## Features

- **Now playing**: a card swiper of movies currently in theaters.
- **Popular**: a horizontal list that loads more pages as you scroll (infinite scroll with a `Stream`).
- **Movie detail**: a collapsing `SliverAppBar` backdrop, poster with a `Hero` animation, original title, release date, rating, overview and cast.
- **Search**: a `SearchDelegate` that queries TMDB as you type.

## Tech

- Flutter 2.x with sound null safety (Dart `>=2.12 <3.0`)
- [`http`](https://pub.dev/packages/http) for the TMDB REST calls
- [`flutter_card_swipper`](https://pub.dev/packages/flutter_card_swipper) for the now-playing carousel

## Project structure

```
lib/
├── main.dart
└── src/
    ├── models/      # Pelicula and Actor models (JSON parsing)
    ├── pages/       # HomePage, PeliculaDetallePage
    ├── providers/   # PeliculasProvider: TMDB API calls
    ├── routes/      # Named routes
    ├── search/      # DataSearch (SearchDelegate)
    └── widgets/     # Card swiper and horizontal list
```

## Getting started

1. Install a Flutter 2.x SDK (the project was last tested with **2.10.5**; Dart 3 / Flutter 3.10+ won't resolve the SDK constraint).
2. Get a free TMDB API key (v3 auth) at <https://www.themoviedb.org/settings/api>.
3. Run it, passing the key at build time with `--dart-define`:

   ```bash
   flutter pub get
   flutter run --dart-define=TMDB_API_KEY=your_api_key            # Android / iOS device or emulator
   flutter run -d chrome --dart-define=TMDB_API_KEY=your_api_key  # or in the browser
   ```

   The same flag works for `flutter build` (e.g. `flutter build apk --dart-define=TMDB_API_KEY=...`). Without it the app opens a screen saying the key is missing ("Falta la API key de TMDB").

   **VS Code:** the included launch configuration reads the key from the `TMDB_API_KEY` environment variable, so export it in the shell you start VS Code from:

   ```bash
   export TMDB_API_KEY=your_api_key
   code .
   ```

### About the API key

Never commit your key. `--dart-define` keeps it out of the source, but it is still compiled into the app binary, where someone determined enough can extract it. That's fine for a personal project using TMDB's free read-only API; a production app should proxy requests through its own backend instead.

## Notes

`home_page.dart`: `SafeArea` keeps content clear of devices that have a notch at the top.

---

This product uses the TMDB API but is not endorsed or certified by TMDB.
