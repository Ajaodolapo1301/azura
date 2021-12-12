
import 'dart:convert';
import 'package:azura_lab/feature/home/data/model/Sport_mode.dart';
import 'package:azura_lab/feature/home/data/model/countryModel.dart';
import 'package:http/http.dart' as http;
abstract class AbstractSport {
  Future <Map<String, dynamic>> getSports();



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





}