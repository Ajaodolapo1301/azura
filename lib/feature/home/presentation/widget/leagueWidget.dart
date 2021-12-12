
import 'package:azura_lab/core/styles/color_utils.dart';
import 'package:azura_lab/core/styles/fontSize.dart';
import 'package:azura_lab/feature/home/domain/entities/leagues.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
        height: 300.h,
        // width: 300,
        child: Material(
          elevation: 1,
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding:  EdgeInsets.all(15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CachedNetworkImage(imageUrl: leagues.strBadge, fit: BoxFit.fitWidth, width: 50.w,),
                    Icon(Icons.more_vert)
                  ],
                ),
                SizedBox(height: 20.h,),
                Container(
                    width: 150.w,
                    child:   Text(leagues.strLeagueAlternate, style: kBold.copyWith(fontSize: 15.sp, color: brown),)
                ),
                Spacer(),
                Column(
                  children: [
                    Text(leagues.strLeague,
                        overflow: TextOverflow.ellipsis,
                      style: kBold500.copyWith(fontSize: 12.sp, color: brown),)

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