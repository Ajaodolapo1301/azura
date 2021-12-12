
import 'package:azura_lab/core/GlobalState/baseState.dart';
import 'package:azura_lab/core/error/failures.dart';
import 'package:azura_lab/feature/home/domain/entities/country_entity.dart';
import 'package:azura_lab/feature/home/domain/entities/leagues.dart';
import 'package:azura_lab/feature/home/domain/entities/sport_entity.dart';
import 'package:azura_lab/feature/home/domain/use_cases/get_country_use_case.dart';
import 'package:azura_lab/feature/home/domain/use_cases/get_leagues_use_case.dart';
import 'package:azura_lab/feature/home/domain/use_cases/get_sport_use_case.dart';
import 'package:dartz/dartz.dart';

abstract class  AbstractDashboardViewModel extends BaseViewModel {

  Future<Either<Failure, List<Sport>>> getSport();
  Future<Either<Failure, List<Country>>> getCountry();
  Future<Either<Failure, List<Leagues>>> getLeaguesByCountry({sport, country});
}

class SportState extends AbstractDashboardViewModel{
  final GetSportUseCase getSportUseCase;
  final GetCountryUseCase getCountryUseCase;
  final GetLeaguesUseCase getLeaguesUseCase;



  SportState({ GetSportUseCase sportUseCase, GetCountryUseCase countryUseCase, GetLeaguesUseCase leaguesUseCase}) :
        assert (sportUseCase != null),
        assert(countryUseCase != null),
        assert(leaguesUseCase != null),
        getSportUseCase = sportUseCase,
        getCountryUseCase = countryUseCase,
        getLeaguesUseCase = leaguesUseCase;


  List<Sport> _sport= [];
  List<Sport> get sport => _sport;
  set sport(List<Sport>sport1) {
    _sport = sport1;
    notifyListeners();
  }

  List<Leagues> _leagues= [];
  List<Leagues> get leagues => _leagues;
  set leagues(List<Leagues>value) {
    _leagues = value;
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

  @override
  Future<Either<Failure, List<Leagues>>> getLeaguesByCountry({sport, country})async {
    setBusy(true);
    var res = await getLeaguesUseCase.call(sport: sport, country: country);
    setBusy(false);
    res.fold((l) {

      return l.props.first.toString();
    }, (r) {

      _leagues = r;


    });


    return res;
  }

}