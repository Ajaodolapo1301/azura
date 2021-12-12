

import 'package:azura_lab/feature/home/domain/entities/Teams.dart';
import 'package:flutter/material.dart';

class TeamWidget extends StatelessWidget {
  Team teams;
  VoidCallback onTap;
  TeamWidget({Key key, this.teams, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(

        child: Row(
          children: [
            Image.network(teams.strTeamBadge, width: 30,),
            SizedBox(width: 30,),
            Text(teams.strTeam)
          ],
        ),
      ),
    );
  }
}