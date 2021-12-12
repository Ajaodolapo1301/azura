
import 'package:azura_lab/core/error/failures.dart';
import 'package:azura_lab/core/usecases/usecase.dart';
import 'package:azura_lab/feature/home/domain/entities/leagues.dart';
import 'package:azura_lab/feature/home/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';
class GetLeaguesUseCase implements UseCase<List<Leagues>> {
  final SportRepository repository;

  GetLeaguesUseCase(this.repository);

  @override
  Future<Either<Failure, List<Leagues>>> call({sport, country}) async {
    return await repository.getLeaguesByCountry(sport: sport, country: country);
  }
}