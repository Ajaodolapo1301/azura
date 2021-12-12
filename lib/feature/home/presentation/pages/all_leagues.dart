
import 'package:azura_lab/core/navigation/navigator.dart';
import 'package:azura_lab/core/navigation/route_generator.dart';
import 'package:azura_lab/core/widget/header.dart';
import 'package:azura_lab/core/widget/loading_overlay_widget.dart';
import 'package:azura_lab/feature/home/domain/entities/leagues.dart';
import 'package:azura_lab/feature/home/presentation/view_model/sport_view_model.dart';
import 'package:azura_lab/feature/home/presentation/widget/leagueWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

class LeaguePage extends StatefulWidget {
  // List <Leagues> leagues = [];

  // LeaguePage({Key key, this.leagues}) : super(key: key);

  @override
  _LeaguePageState createState() => _LeaguePageState();
}

class _LeaguePageState extends State<LeaguePage> {
  SportState sportState;

  @override
  Widget build(BuildContext context) {
    sportState = Provider.of<SportState>(context);
    return LoadingOverlayWidget(
      loading: sportState.busy,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Header(
                    text: "Leagues",
                  ),
                ),

                Expanded(
                  child: AnimationLimiter(
                    child: GridView.builder(
                      itemCount: sportState.leagues.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.9,
                          crossAxisSpacing: 15, mainAxisSpacing: 7, crossAxisCount: 2),
                      itemBuilder: (BuildContext context, int index) {
                        return  AnimationConfiguration.staggeredGrid(
                          position: index,
                          duration: const Duration(milliseconds: 700),
                          columnCount: 2,
                          child: ScaleAnimation(
                            child: FadeInAnimation(
                              child:  LeagueWidget(
                                  onTap: (){
                                    fetchteams("", index);
                                  },
                                  leagues:sportState.leagues[index]
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void fetchteams(id, index) async {
    var res = await sportState.getTeams(id: id);
    print(res);
    res.fold((l) => null, (r) {
      pushNamedRoute(context, teamsPage, args: sportState.leagues[index]);
    });
    // if (res["error"] == false && res["teams"] !=  null) {
    //   setState(() {
    //     // leagues = res["leagues"];
    //   });
    //   pushTo(context, TeamPage(teams: res["teams"], leagues: widget.leagues[index], ));
    // }

  }
}