import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:movies/src/models/pelicula_model.dart';

class CardSwiperW extends StatelessWidget {
  final List<Pelicula> elementos;

  CardSwiperW({@required this.elementos});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            child: FadeInImage(
                placeholder: AssetImage('assets/imgs/loading.gif'),
                image: NetworkImage(elementos[index].getImgUrl()),
                fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(20.0),
          );
        },
        itemCount: elementos.length,
        // pagination: new SwiperPagination(),
        // control: new SwiperControl(),
        layout: SwiperLayout.STACK,
        itemWidth: _screenSize.width * 0.5,
        itemHeight: _screenSize.height * 0.5,
      ),
      margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
    );
  }
}
