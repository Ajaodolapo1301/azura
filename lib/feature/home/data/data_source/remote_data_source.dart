
import 'dart:convert';
import 'package:azura_lab/feature/home/data/model/Sport_model.dart';
import 'package:azura_lab/feature/home/data/model/country_model.dart';

import 'package:http/http.dart' as http;
abstract class AbstractSport {
  Future <Map<String, dynamic>> getSports();
  Future <Map<String, dynamic>> getCountry();


}

const baseUrl = "https://www.thesportsdb.com/api/v1/json/2";
class SportApi implements AbstractSport{


  @override
  Future<Map<String, dynamic>> getSports() async{
    Map<String, dynamic> result = {};
    final String uri = "$baseUrl/all_sports.php";
    final url = Uri.parse(uri);



    print(url);
    try {
      var response = await http.get(url,).timeout(Duration(seconds: 30));
      int statusCode = response.statusCode;

      if (statusCode == 200) {

        result["error"] = false;
        List<SportModel> sportModel = [];
        (jsonDecode(response.body)["sports"] as List).forEach((dat){
          sportModel.add(SportModel.fromJson(dat));
        });
        result["sport"] = sportModel;

      } else if (statusCode == 500) {
        result['error'] = true;
        result["message"] = "Internal Server Error";

      } else {
        result['error'] = true;
        result["message"] = jsonDecode(response.body)["message"];
      }
    } catch (error) {


    }
    // print(result);
    return result;
  }

  @override
  Future<Map<String, dynamic>> getCountry() async{
    Map<String, dynamic> result = {};
    final String uri = "$baseUrl/all_countries.php";
    final url = Uri.parse(uri);



    print(url);
    try {
      var response = await http.get(url,).timeout(Duration(seconds: 30));
      int statusCode = response.statusCode;

      if (statusCode == 200) {

        result["error"] = false;
        List<CountryModel> countryModel = [];
        (jsonDecode(response.body)["countries"] as List).forEach((dat){
          countryModel.add(CountryModel.fromJson(dat));
        });
        result["countryModel"] = countryModel;

      } else if (statusCode == 500) {
        result['error'] = true;
        result["message"] = "Internal Server Error";

      } else {
        result['error'] = true;
        result["message"] = jsonDecode(response.body)["message"];
      }
    } catch (error) {


    }
    // print(result);
    return result;
  }



}