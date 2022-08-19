import 'package:flutter/material.dart';
import 'package:shop_app_in_provider/pages/detail_page.dart';
import 'package:shop_app_in_provider/services/product_service.dart';
import 'pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

  @override
  Widget build(BuildContext context) {
    return ProductService(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorObservers: [routeObserver],
        title: "Learn State Management Lesson 1",
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.black),
          ),
        ),
        home: const HomePage(),
        routes: {
          HomePage.id: (context) => const HomePage(),
          DetailPage.id: (context) => const DetailPage(),
        },
      ),
    );
  }
}