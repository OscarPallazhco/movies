import 'package:flutter/material.dart';

import 'package:movies/src/pages/home_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {

  Map<String, WidgetBuilder> routes = {
    '/'                 : (BuildContext context) => HomePage(),  
  };

  return routes;

}