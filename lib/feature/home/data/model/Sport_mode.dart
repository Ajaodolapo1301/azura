

import 'package:azura_lab/feature/home/domain/entities/sport_entity.dart';

class SportModel extends Sport {


  SportModel(
      {idSport,
        strSport,
        strFormat,
        strSportThumb,
        strSportIconGreen,
        strSportDescription}) : super(idSport:idSport, strFormat: strFormat, strSport: strSport, strSportDescription: strSportDescription, strSportIconGreen: strSportIconGreen, strSportThumb: strSportThumb);

 factory SportModel.fromJson(Map<String, dynamic> json) {
 return SportModel(
   idSport: json['idSport'],
   strSportThumb: json['strSportThumb'],
   strSportIconGreen: json['strSportIconGreen'],
   strSportDescription: json['strSportDescription'],
   strSport: json['strSport'],
   strFormat: json['strFormat'],

 );
 }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idSport'] = this.idSport;
    data['strSport'] = this.strSport;
    data['strFormat'] = this.strFormat;
    data['strSportThumb'] = this.strSportThumb;
    data['strSportIconGreen'] = this.strSportIconGreen;
    data['strSportDescription'] = this.strSportDescription;
    return data;
  }
}