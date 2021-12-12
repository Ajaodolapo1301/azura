

import 'package:azura_lab/core/navigation/navigator.dart';
import 'package:azura_lab/core/navigation/route_generator.dart';
import 'package:azura_lab/core/styles/color_utils.dart';
import 'package:azura_lab/core/styles/fontSize.dart';
import 'package:azura_lab/core/widget/custom_text_field.dart';
import 'package:azura_lab/core/widget/header.dart';
import 'package:azura_lab/feature/home/domain/entities/Teams.dart';
import 'package:azura_lab/feature/home/domain/entities/leagues.dart';
import 'package:azura_lab/feature/home/presentation/view_model/sport_view_model.dart';
import 'package:azura_lab/feature/home/presentation/widget/team_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';


class TeamPage extends StatefulWidget {

  Leagues leagues;
  TeamPage({Key key,  this.leagues}) : super(key: key);

  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  SportState sportState;
  List<Team> filteredList = [];

  @override
  Widget build(BuildContext context) {
    sportState = Provider.of<SportState>(context);
    if (filteredList.isEmpty) {
      setState(() {
        filteredList = sportState.team;
      });
    }
    return Scaffold(
      backgroundColor: brown,
      body: SafeArea(
        bottom: false,
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: Header(
                  text: "Teams",
                    color: Colors.white,
                    iconColor: brown,
                  preferredActionOnBackPressed: (){
                    pop(context);
                  },
                ),
              ),

             SizedBox(height: 20.h,),
             Container(
               height: 200.h,
                 child:
             Column(
               children: [
                 CachedNetworkImage(imageUrl: widget.leagues.strBadge, width: 100.w,),
                 SizedBox(height: 20.h,),
                 Text(widget.leagues.strLeague, style: kBold700.copyWith(color: Colors.white),),
                 SizedBox(height: 20.h,),
                 Text(widget.leagues.strLeagueAlternate, style: kBold700.copyWith(color: Colors.white),)
               ],
             )
             ),

        Expanded(
          // height: 400,
          child: Material(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(

          ),
          width: double.infinity,
            child: Column(
              children: [
              CustomTextField(
                hint: "Search",
                onChanged: (v) {
                  if (v.isNotEmpty) {
                    setState(() {
                      filteredList =  sportState.team
                          .where((cust) => cust.strTeam
                          .toString()
                          .toLowerCase()
                          .contains(v))
                          .toList();
                    });
                  } else {
                    setState(() {
                      filteredList =  sportState.team;
                    });
                  }
                },
                suffix: Icon(Icons.search, color: brown,size: 20.sp,),
              ),
                SizedBox(height: 10.h,),
                Expanded(
                  child: ListView.separated(

                      itemBuilder: (context,index){
                        return TeamWidget(teams: filteredList[index], onTap: (){
                          pushNamedRoute(context, teamsDetails, args:filteredList[index] );
                          // pushTo(context, TeamDetails(teams: filteredList[index],));
                        },);
                      }, separatorBuilder: (context,index){
                    return Divider(height: 25.h,);
                  }, itemCount: filteredList.length),
                ),
              ],

            )

            ),
          ),
        )



            ],
          ),
        ),
      ),
    );
  }


}


