
import 'package:azura_lab/core/widget/header.dart';
import 'package:azura_lab/feature/home/domain/entities/leagues.dart';
import 'package:azura_lab/feature/home/presentation/widget/leagueWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class LeaguePage extends StatefulWidget {
  List <Leagues> leagues = [];

  LeaguePage({Key key, this.leagues}) : super(key: key);

  @override
  _LeaguePageState createState() => _LeaguePageState();
}

class _LeaguePageState extends State<LeaguePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Header(
                  text: "Leagues",
                ),
              ),

              Expanded(
                child: AnimationLimiter(
                  child: GridView.builder(
                    itemCount: widget.leagues.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 15, mainAxisSpacing: 5, crossAxisCount: 2),
                    itemBuilder: (BuildContext context, int index) {
                      return  AnimationConfiguration.staggeredGrid(
                        position: index,
                        duration: const Duration(milliseconds: 700),
                        columnCount: 2,
                        child: ScaleAnimation(
                          child: FadeInAnimation(
                            child:  LeagueWidget(
                                onTap: (){
                                  // fetchteams("", index);
                                },
                                leagues:widget.leagues[index]
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
    );
  }

  // void fetchteams(id, index) async {
  //   var res = await SportApi().getallteams(id: id);
  //   if (res["error"] == false && res["teams"] !=  null) {
  //     setState(() {
  //       // leagues = res["leagues"];
  //     });
  //     pushTo(context, TeamPage(teams: res["teams"], leagues: widget.leagues[index], ));
  //   }
  //
  // }
}