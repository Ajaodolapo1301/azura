
import 'package:azura_lab/feature/home/presentation/pages/all_leagues.dart';
import 'package:azura_lab/feature/home/presentation/pages/home.dart';
import 'package:flutter/material.dart';



const String initialPage = '/';
const String leaguesPage = '/all-leagues';

class RouteRegenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case initialPage:
        return MaterialPageRoute(
          builder: (_) =>  Home(),
        );
      case leaguesPage:
        return MaterialPageRoute(
          builder: (_) =>  LeaguePage(leagues: args,),
        );
      default:
        return _errorRoute();
    }
  }


  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
