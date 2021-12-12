
import 'package:azura_lab/core/error/failures.dart';
import 'package:azura_lab/core/usecases/usecase.dart';
import 'package:azura_lab/feature/home/domain/entities/Teams.dart';
import 'package:azura_lab/feature/home/domain/entities/country_entity.dart';

import 'package:azura_lab/feature/home/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class GetTeamUseCase implements UseCase<List<Team>> {
  final SportRepository repository;

  GetTeamUseCase(this.repository);

  @override
  Future<Either<Failure, List<Team>>> call({id}) async {
    return await repository.getTeams(id: id);
  }
}