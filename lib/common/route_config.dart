import 'package:flutter/material.dart';
import 'package:wan_android_flutter/routes/login_page.dart';

import '../main.dart';
import '../routes/article_detail_page.dart';


///@author ： 于德海
///time ： 2024/2/22 11:37
///desc ：


class RouteName{
  static const String home = "/";
  static const String detail = "/detail";
  static const String login = "/login";
}

Map<String,WidgetBuilder> globalRoutes = {
  RouteName.home: (context) => MyHomePage(),
  RouteName.detail: (context) => ArticleDetailPage(),
  RouteName.login: (context) => LoginPage(),

};