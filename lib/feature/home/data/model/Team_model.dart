
import 'package:azura_lab/feature/home/domain/entities/Teams.dart';

class TeamsModel extends Team {


  TeamsModel(
      {
        idTeam,
        idSoccerXML,
        idAPIfootball,
        intLoved,
        strTeam,
        strTeamShort,
        strAlternate,
        intFormedYear,
        strSport,
        strLeague,
        strCountry,
        strTeamBadge,
        strTeamJersey,
        strTeamLogo,
        strTeamBanner,


      });

  TeamsModel.fromJson(Map<String, dynamic> json) {
    idTeam = json['idTeam'];
    idSoccerXML = json['idSoccerXML'];
    idAPIfootball = json['idAPIfootball'];
    intLoved = json['intLoved'];
    strTeam = json['strTeam'];
    strTeamShort = json['strTeamShort'];
    strAlternate = json['strAlternate'];
    intFormedYear = json['intFormedYear'];
    strSport = json['strSport'];
    strLeague = json['strLeague'];

    strLeague4 = json['strLeague4'];
    strCountry = json['strCountry'];
    strTeamBadge = json['strTeamBadge'];
    strTeamJersey = json['strTeamJersey'];
    strTeamLogo = json['strTeamLogo'];

    strTeamBanner = json['strTeamBanner'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idTeam'] = this.idTeam;
    data['idSoccerXML'] = this.idSoccerXML;
    data['idAPIfootball'] = this.idAPIfootball;
    data['intLoved'] = this.intLoved;
    data['strTeam'] = this.strTeam;
    data['strTeamShort'] = this.strTeamShort;
    data['strAlternate'] = this.strAlternate;
    data['intFormedYear'] = this.intFormedYear;
    data['strSport'] = this.strSport;
    data['strLeague'] = this.strLeague;

    data['strLeague4'] = this.strLeague4;

    data['strCountry'] = this.strCountry;
    data['strTeamBadge'] = this.strTeamBadge;
    data['strTeamJersey'] = this.strTeamJersey;
    data['strTeamLogo'] = this.strTeamLogo;

    data['strTeamBanner'] = this.strTeamBanner;

    return data;
  }
}
