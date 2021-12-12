import 'package:azura_lab/core/error/failures.dart';
import 'package:azura_lab/core/network/network_info.dart';
import 'package:azura_lab/feature/home/data/data_source/remote_data_source.dart';
import 'package:azura_lab/feature/home/domain/entities/sport_entity.dart';
import 'package:azura_lab/feature/home/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class SportRepositoryImpl extends SportRepository {
  final AbstractSport abstractSportDataSource;

  final NetworkInfo networkInfo;

  SportRepositoryImpl({this.abstractSportDataSource, this.networkInfo});

  @override
  Future<Either<Failure, List<Sport>>> getSport() async {
    if (await networkInfo.isConnected) {
      var res = await abstractSportDataSource.getSports();
      if (res["error"] == false) {
        return Right(res["sport"]);
      } else {
        return Left(ServerFailure(res["message"] ?? "An Error Occurred"));
      }
    } else {
      return Left(ServerFailure("No internet access"));
    }
  }
}
