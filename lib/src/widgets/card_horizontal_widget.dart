import 'package:flutter/material.dart';
import 'package:movies/src/models/pelicula_model.dart';

class CardHorizontalW extends StatelessWidget {
  final List<Pelicula> items;
  final Function functionAddItems;

  CardHorizontalW({@required this.items, @required this.functionAddItems});

  final PageController _pageController = PageController(
    initialPage: 1,
    viewportFraction: 0.3,
  );

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    _pageController.addListener((){
      if (_pageController.position.pixels >= _pageController.position.maxScrollExtent - 200.0) {
        functionAddItems();
      }
    });

    return Container(
      height: _screenSize.height * 0.3,
      child: PageView.builder(
        controller: _pageController,
        pageSnapping: false,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return _tarjetaHor(context, items[index]);
        },
      ),
    );
  }

  Widget _tarjetaHor (BuildContext context, Pelicula pelicula){
    final tarjeta =  Container(
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
            SizedBox(
              height: 5.0,
            ),
            Text(
              pelicula.title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      );
    
    return GestureDetector(
      child: tarjeta,
      onTap: (){
        Navigator.pushNamed(context, 'peliculadetalle', arguments: pelicula);
      },
    );

  }
}
