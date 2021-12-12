


import 'package:azura_lab/feature/home/domain/entities/leagues.dart';

class LeaguesModel  extends Leagues{

  LeaguesModel(
      {idLeague,

        idAPIfootball,
        strSport,
        strLeague,
        strLeagueAlternate,
        strDivision,
        idCup,

        strBadge,
        strLogo,

        strNaming,
        strLocked}) : super(idAPIfootball: idAPIfootball, idCup: idCup, idLeague: idLeague, strDivision: strDivision, strSport: strSport, strBadge: strBadge, strLeague: strLeague, strLeagueAlternate: strLeagueAlternate, strLocked: strLocked, strLogo: strLogo, strNaming: strNaming,);

  LeaguesModel.fromJson(Map<String, dynamic> json) {
    idLeague = json['idLeague'];

    idAPIfootball = json['idAPIfootball'];
    strSport = json['strSport'];
    strLeague = json['strLeague'];
    strLeagueAlternate = json['strLeagueAlternate'];
    strDivision = json['strDivision'];
    idCup = json['idCup'];



    strBadge = json['strBadge'];
    strLogo = json['strLogo'];
    // strPoster = json['strPoster'];
    // strTrophy = json['strTrophy'];
    strNaming = json['strNaming'];
    // strComplete = json['strComplete'];
    strLocked = json['strLocked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idLeague'] = this.idLeague;

    data['idAPIfootball'] = this.idAPIfootball;
    data['strSport'] = this.strSport;
    data['strLeague'] = this.strLeague;
    data['strLeagueAlternate'] = this.strLeagueAlternate;
    data['strDivision'] = this.strDivision;
    data['idCup'] = this.idCup;

    data['strLocked'] = this.strLocked;
    return data;
  }
}
