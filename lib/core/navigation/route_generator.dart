
import 'package:azura_lab/feature/home/presentation/pages/all_leagues.dart';
import 'package:azura_lab/feature/home/presentation/pages/home.dart';
import 'package:azura_lab/feature/home/presentation/pages/teamDetails.dart';
import 'package:azura_lab/feature/home/presentation/pages/teams.dart';
import 'package:flutter/material.dart';



const String initialPage = '/';
const String leaguesPage = '/all-leagues';
const String teamsPage = '/all-teams';
const String teamsDetails = '/teams-details';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case initialPage:
        return MaterialPageRoute(
          builder: (_) =>  Home(),
        );
      case leaguesPage:
        return MaterialPageRoute(
          builder: (_) =>  LeaguePage(),
        );

      case teamsPage:
        return MaterialPageRoute(
          builder: (_) =>  TeamPage(leagues: args,),
        );
      case teamsDetails:
        return MaterialPageRoute(
          builder: (_) =>  TeamDetails(teams: args,),
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
