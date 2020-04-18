import 'package:flutter/material.dart';
import 'package:movies/src/models/pelicula_model.dart';
import 'package:movies/src/models/actor_model.dart';
import 'package:movies/src/providers/peliculas_provider.dart';

class PeliculaDetallePage extends StatelessWidget {
  final PeliculasProvider _peliculasProvider = new PeliculasProvider();

  @override
  Widget build(BuildContext context) {
    final Pelicula pelicula = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        _crearAppBar(pelicula),
        SliverList(
            delegate: SliverChildListDelegate([
          SizedBox(
            height: 10.0,
          ),
          _posterTitulo(context, pelicula),
          _descripcion(pelicula),
          _crearCasting(pelicula),
        ])),
      ],
    ));
  }

  Widget _crearAppBar(Pelicula pelicula) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          pelicula.title,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/imgs/loading.gif'),
          image: NetworkImage(pelicula.getBackdropImg()),
          fit: BoxFit.cover,
          // fadeInDuration: Duration(microseconds: 3600),
        ),
      ),
    );
  }

  Widget _posterTitulo(BuildContext context, Pelicula pelicula) {
    return Container(
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      child: Row(
        children: <Widget>[
          Hero(
            tag: pelicula.uniqueId,
            child: ClipRRect(
              child: Image(
                image: NetworkImage(pelicula.getImgUrl()),
                height: 150.0,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  pelicula.title,
                  style: Theme.of(context).textTheme.title,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  pelicula.originalTitle,
                  style: Theme.of(context).textTheme.subhead,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  pelicula.releaseDate,
                  style: Theme.of(context).textTheme.subhead,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.star_half,
                      color: Colors.orangeAccent,
                    ),
                    Text(
                      pelicula.voteAverage.toString(),
                      style: Theme.of(context).textTheme.subhead,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _descripcion(Pelicula pelicula) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Text(
        pelicula.overview,
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _crearCasting(Pelicula pelicula) {
    return FutureBuilder(
      future: _peliculasProvider.getCast(pelicula.id.toString()),
      builder: (BuildContext context, AsyncSnapshot<List<Actor>> snapshot) {
        if (snapshot.hasData) {
          return _crearActoresPageView(snapshot.data);
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _crearActoresPageView(List<Actor> data) {
    return SizedBox(
      height: 200.0,
      child: PageView.builder(
        pageSnapping: false,
        itemCount: data.length,
        controller: PageController(
          initialPage: 1,
          viewportFraction: 0.3,
        ),
        itemBuilder: (BuildContext context, int i) {
          return _tarjetaActor(data[i]);
        },
      ),
    );
  }

  Widget _tarjetaActor(Actor actor) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          ClipRRect(
            child: FadeInImage(
              placeholder: AssetImage('assets/imgs/loading.gif'),
              image: NetworkImage(actor.getImgUrl()),
              fit: BoxFit.cover,
              height: 130.0,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          Text(
            actor.name,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            actor.character,
            overflow: TextOverflow.ellipsis,
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}
