import 'package:azura_lab/core/navigation/navigator.dart';
import 'package:azura_lab/core/styles/color_utils.dart';
import 'package:azura_lab/core/styles/fontSize.dart';
import 'package:azura_lab/core/widget/header.dart';
import 'package:azura_lab/feature/home/domain/entities/Teams.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TeamDetails extends StatefulWidget {
  Team teams;
   TeamDetails({Key key, this.teams}) : super(key: key);

  @override
  _TeamDetailsState createState() => _TeamDetailsState();
}

class _TeamDetailsState extends State<TeamDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: brown,
      body: SafeArea(
        bottom: false,
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Header(
                  text: widget.teams.strTeam,
                  color: Colors.white,
                  preferredActionOnBackPressed: (){
                    pop(context);
                  },
                ),
              ),
              SizedBox(height: 20.h,),
              Expanded(
                child: Container(
                    // height: 200.h,
                    child:
                    Column(
                      children: [
                       CachedNetworkImage(imageUrl: widget.teams.strTeamBadge, width: 150.w,),
                        SizedBox(height: 20.h,),
                        Text(widget.teams.strTeam, style: kBold700.copyWith(color: Colors.white),),
                        SizedBox(height: 20.h,),
                        Text(widget.teams.strLeague, style: kBold700.copyWith(color: Colors.white),)
                      ],
                    )
                ),
              ),
              Expanded(
            flex: 2,
                child: Material(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                  child: Container(
                      padding: EdgeInsets.only(left: 15, right:15, top: 15),
                      decoration: BoxDecoration(

                      ),
                      width: double.infinity,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                          Text("${widget.teams.strTeam} (${widget.teams.strTeamShort})",

                            style: kBold700.copyWith(fontSize: 13.sp),),
                        SizedBox(height: 10.h,),
                            Text(widget.teams.strDescriptionEN,
                              textAlign: TextAlign.justify,
                              style: kBold500.copyWith(fontSize: 13.sp),)

                          ],

                        ),
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
