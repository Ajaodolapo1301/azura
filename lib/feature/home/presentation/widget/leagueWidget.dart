
import 'package:azura_lab/core/styles/fontSize.dart';
import 'package:azura_lab/feature/home/domain/entities/leagues.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class LeagueWidget extends StatelessWidget {
  Leagues leagues;
  VoidCallback onTap;

  LeagueWidget({
    Key key,
    this.leagues,
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(08),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),

        ),
        height: 300,
        // width: 300,
        child: Material(
          elevation: 1,
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.network(leagues.strBadge, fit: BoxFit.fitWidth, width: 50,),
                    Icon(Icons.more_vert)
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Text(leagues.strLeagueAlternate, style: kBold500.copyWith(fontSize: 15.sp),)
                  ],
                )


              ],
            ),
          ),
        ),
      ),
    );
  }



}