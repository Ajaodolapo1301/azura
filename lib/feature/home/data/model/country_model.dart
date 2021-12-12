

import 'package:azura_lab/feature/home/domain/entities/country_entity.dart';

class CountryModel extends Country{


  CountryModel({nameEn}) : super(nameEn: nameEn);


  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
        nameEn: json['name_en']
    );
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name_en'] = this.nameEn;
    return data;
  }
}
