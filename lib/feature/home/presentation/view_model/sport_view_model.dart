
import 'package:azura_lab/core/GlobalState/baseState.dart';
import 'package:azura_lab/core/error/failures.dart';
import 'package:azura_lab/feature/home/domain/entities/sport_entity.dart';
import 'package:azura_lab/feature/home/domain/use_cases/get_sport_use_case.dart';
import 'package:dartz/dartz.dart';

abstract class  AbstractDashboardViewModel extends BaseViewModel {

  Future<Either<Failure, List<Sport>>> getSport();


}

class SportState extends AbstractDashboardViewModel{
  final GetSportUseCase getSportUseCase;



  SportState({ GetSportUseCase sportUseCase, }) :
        assert (sportUseCase != null),


        getSportUseCase = sportUseCase;


  List<Sport> _sport= [];
  List<Sport> get sport => _sport;
  set sport(List<Sport>sport1) {
    _sport = sport1;
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

}