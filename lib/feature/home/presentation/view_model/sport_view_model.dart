
import 'package:azura_lab/core/GlobalState/baseState.dart';
import 'package:azura_lab/core/error/failures.dart';
import 'package:azura_lab/feature/home/domain/entities/country_entity.dart';
import 'package:azura_lab/feature/home/domain/entities/sport_entity.dart';
import 'package:azura_lab/feature/home/domain/use_cases/get_country_use_case.dart';
import 'package:azura_lab/feature/home/domain/use_cases/get_sport_use_case.dart';
import 'package:dartz/dartz.dart';

abstract class  AbstractDashboardViewModel extends BaseViewModel {

  Future<Either<Failure, List<Sport>>> getSport();
  Future<Either<Failure, List<Country>>> getCountry();

}

class SportState extends AbstractDashboardViewModel{
  final GetSportUseCase getSportUseCase;
  final GetCountryUseCase getCountryUseCase;


  SportState({ GetSportUseCase sportUseCase, GetCountryUseCase countryUseCase}) :
        assert (sportUseCase != null),
        assert(countryUseCase != null),

        getSportUseCase = sportUseCase,
        getCountryUseCase = countryUseCase;


  List<Sport> _sport= [];
  List<Sport> get sport => _sport;
  set sport(List<Sport>sport1) {
    _sport = sport1;
    notifyListeners();
  }


  List<Country> _country= [];
  List<Country> get country => _country;
  set country(List<Country>country1) {
    _country = country1;
    notifyListeners();
  }


  @override
  Future<Either<Failure, List<Sport>>> getSport() async{
    setBusy(true);
    var res = await getSportUseCase();
    setBusy(false);
    res.fold((l) {

      return l.props.first.toString();
    }, (r) {

    _sport = r;


    });


    return res;
  }

  @override
  Future<Either<Failure, List<Country>>> getCountry() async{
    setBusy(true);
    var res = await getCountryUseCase();
    setBusy(false);
    res.fold((l) {

      return l.props.first.toString();
    }, (r) {

      _country = r;


    });


    return res;
  }

}