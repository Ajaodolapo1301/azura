
import 'package:azura_lab/core/GlobalState/baseState.dart';
import 'package:azura_lab/core/error/failures.dart';
import 'package:azura_lab/feature/home/domain/entities/Teams.dart';
import 'package:azura_lab/feature/home/domain/entities/country_entity.dart';
import 'package:azura_lab/feature/home/domain/entities/leagues.dart';
import 'package:azura_lab/feature/home/domain/entities/sport_entity.dart';
import 'package:azura_lab/feature/home/domain/use_cases/get_country_use_case.dart';
import 'package:azura_lab/feature/home/domain/use_cases/get_leagues_use_case.dart';
import 'package:azura_lab/feature/home/domain/use_cases/get_sport_use_case.dart';
import 'package:azura_lab/feature/home/domain/use_cases/get_teams_use_case.dart';
import 'package:dartz/dartz.dart';

abstract class  AbstractDashboardViewModel extends BaseViewModel {

  Future<Either<Failure, List<Sport>>> getSport();
  Future<Either<Failure, List<Country>>> getCountry();
  Future<Either<Failure, List<Leagues>>> getLeaguesByCountry({sport, country});
  Future<Either<Failure, List<Team>>> getTeams({id});
}

class SportState extends AbstractDashboardViewModel{
  final GetSportUseCase getSportUseCase;
  final GetCountryUseCase getCountryUseCase;
  final GetLeaguesUseCase getLeaguesUseCase;
  final GetTeamUseCase getTeamUseCase;


  SportState({ GetSportUseCase sportUseCase, GetCountryUseCase countryUseCase, GetLeaguesUseCase leaguesUseCase, GetTeamUseCase teamUseCase}) :
        assert (sportUseCase != null),
        assert(countryUseCase != null),
        assert(leaguesUseCase != null),
        assert(teamUseCase != null),
        getSportUseCase = sportUseCase,
        getCountryUseCase = countryUseCase,
        getLeaguesUseCase = leaguesUseCase,
  getTeamUseCase = teamUseCase;

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

  List<Team> _team= [];
  List<Team> get team => _team;
  set team(List<Team>value) {
    _team = value;
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

  @override
  Future<Either<Failure, List<Team>>> getTeams({id}) async{
    setBusy(true);
    var res = await getTeamUseCase.call(id: id);
    setBusy(false);
    res.fold((l) {

      return l.props.first.toString();
    }, (r) {

      _team = r;


    });


    return res;
  }

}