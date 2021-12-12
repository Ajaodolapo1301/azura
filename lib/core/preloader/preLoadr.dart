
import 'package:flutter/material.dart';


class Preloader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Spacer(),

      CircularProgressIndicator(),
      Spacer(),

    ],);

  }
}