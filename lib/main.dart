import 'dart:async';


import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'core/GlobalState/baseState.dart';
import 'core/navigation/route_generator.dart';
import 'feature/home/presentation/pages/home.dart';
import 'feature/home/presentation/view_model/sport_view_model.dart';
import 'injection_container.dart' as di;
final sl = GetIt.instance;
Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();


  runZonedGuarded<Future<void>>(()async {
    runApp(

        DevicePreview(
          enabled: false,
          builder: (context) =>   MultiProvider(
            providers: [

              ChangeNotifierProvider(create: (_) => BaseViewModel()),
              ChangeNotifierProvider(create: (_) => SportState(sportUseCase:sl() ,
              countryUseCase: sl(), leaguesUseCase: sl(), teamUseCase: sl()
              )),

            ],
            child: MyApp(

            ),
          ),

        )

    );

  }, (error, stackTrace) async{


  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(375, 812),
        builder: () => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Azura Lab',
            theme: ThemeData(
              primarySwatch: Colors.red,
              fontFamily: 'SofiaPro',

            ),
          initialRoute: '/',

          onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
        )
    );
  }
}