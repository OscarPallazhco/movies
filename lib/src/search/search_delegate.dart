import 'package:flutter/material.dart';
import 'package:movies/src/models/pelicula_model.dart';
import 'package:movies/src/providers/peliculas_provider.dart';

class DataSearch extends SearchDelegate {
  final PeliculasProvider peliculasProvider = new PeliculasProvider();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(); 
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    }

    return FutureBuilder(
      future: peliculasProvider.getBusqPelicula(query),
      builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
        if (snapshot.hasData) {
          final List<Pelicula> peliculasResult = snapshot.data!;
          return ListView(
            children: peliculasResult.map((Pelicula peliculaResult) {
              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: FadeInImage(
                    placeholder: AssetImage('assets/imgs/loading.gif'),
                    image: NetworkImage(peliculaResult.getImgUrl()),
                    width: 40.0,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(peliculaResult.title!),
                subtitle: Column(
                  children: <Widget>[
                    Text(peliculaResult.originalTitle!),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                onTap: () {
                  close(context, null);
                  peliculaResult.uniqueId='${peliculaResult.id}-search';
                  Navigator.of(context).pushNamed('peliculadetalle', arguments: peliculaResult);
                },
              );
            }).toList(),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
