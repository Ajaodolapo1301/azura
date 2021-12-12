


import 'package:equatable/equatable.dart';

class Sport  extends Equatable {
 final String idSport;
 final String strSport;
 final String strFormat;
 final  String strSportThumb;
 final  String strSportIconGreen;
 final  String strSportDescription;

  Sport(
      { this.idSport,
        this.strSport,
        this.strFormat,
        this.strSportThumb,
        this.strSportIconGreen,
        this.strSportDescription});


}