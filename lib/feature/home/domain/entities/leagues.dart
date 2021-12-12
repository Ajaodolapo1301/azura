

import 'package:equatable/equatable.dart';

class Leagues extends Equatable  {
  String idLeague;
  String idAPIfootball;
  String strSport;
  String strLeague;
  String strLeagueAlternate;
  String strDivision;
  String idCup;


  String strBadge;
  String strLogo;

  String strNaming;

  String strLocked;

  Leagues(
      {this.idLeague,

        this.idAPIfootball,
        this.strSport,
        this.strLeague,
        this.strLeagueAlternate,
        this.strDivision,
        this.idCup,
        this.strBadge,
        this.strLogo,

        this.strNaming,

        this.strLocked});


}
