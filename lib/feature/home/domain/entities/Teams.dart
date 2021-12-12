
import 'package:equatable/equatable.dart';

class Team extends Equatable  {
  String idTeam;
  String idSoccerXML;
  String idAPIfootball;
  String intLoved;
  String strTeam;
  String strTeamShort;
  String strAlternate;
  String intFormedYear;
  String strSport;
  String strLeague;
  // String idLeague;
  // String strLeague2;
  // String idLeague2;
  // String strLeague3;
  // String idLeague3;
  String strLeague4;

  String strDescriptionEN;

  String strCountry;
  String strTeamBadge;
  String strTeamJersey;
  String strTeamLogo;

  String strTeamBanner;


  Team(
      {
        this.idTeam,
        this.idSoccerXML,
        this.idAPIfootball,
        this.intLoved,
        this.strTeam,
        this.strTeamShort,
        this.strAlternate,
        this.intFormedYear,
        this.strSport,
        this.strLeague,

        this.strDescriptionEN,

        this.strCountry,
        this.strTeamBadge,
        this.strTeamJersey,
        this.strTeamLogo,

        this.strTeamBanner,

      });

}
