import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwiperW extends StatelessWidget {
  List<dynamic> elementos;

  CardSwiperW({@required this.elementos});

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;

    return Container(
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            child: Image.network(
              "http://via.placeholder.com/350x150",
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10.0),
          );
        },
        itemCount: 5,
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
