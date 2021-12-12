
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;


import 'core/network/network_info.dart';
import 'feature/home/data/data_source/remote_data_source.dart';
import 'feature/home/data/repository/repository.dart';
import 'feature/home/domain/repository/repository.dart';
import 'feature/home/domain/use_cases/get_country_use_case.dart';
import 'feature/home/domain/use_cases/get_leagues_use_case.dart';
import 'feature/home/domain/use_cases/get_sport_use_case.dart';
import 'feature/home/presentation/view_model/sport_view_model.dart';


final sl = GetIt.instance;

Future<void> init() async {

  sl.registerFactory(
    () => SportState(
      sportUseCase: sl(),
      countryUseCase: sl(),
        leaguesUseCase: sl()

    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetSportUseCase(sl()));
  sl.registerLazySingleton(() => GetCountryUseCase(sl()));
  sl.registerLazySingleton(() => GetLeaguesUseCase(sl()));
  // Repository
  sl.registerLazySingleton<SportRepository>(
    () => SportRepositoryImpl(

      networkInfo: sl(),
      abstractSportDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<AbstractSport>(
    () => SportApi(),
  );



  //! Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External


  sl.registerLazySingleton(() => DataConnectionChecker());
}
