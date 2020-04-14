import 'package:flutter/material.dart';
import 'package:movies/src/models/pelicula_model.dart';

class CardHorizontalW extends StatelessWidget {
  final List<Pelicula> items;

  CardHorizontalW({@required this.items});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      height: _screenSize.height * 0.3,
      child: PageView(
        children: _tarjetasHor(context),
        controller: PageController(
          initialPage: 1,
          viewportFraction: 0.3,
        ),
        pageSnapping: false,
      ),
    );
  }

  List<Widget> _tarjetasHor(BuildContext context) {
    return items.map((Pelicula pelicula) {
      return Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
              child: FadeInImage(
                placeholder: AssetImage('assets/imgs/loading.gif'),
                image: NetworkImage(pelicula.getImgUrl()),
                fit: BoxFit.cover,
                height: 180.0,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            SizedBox(height: 5.0,),
            Text(
              pelicula.title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      );
    }).toList();
  }
}
