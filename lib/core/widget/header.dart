

import 'dart:io';


import 'package:azura_lab/core/navigation/navigator.dart';
import 'package:azura_lab/core/styles/color_utils.dart';
import 'package:flutter/material.dart';


class Header extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final Color backgroundColor;
  final VoidCallback preferredActionOnBackPressed;
  final Widget suffix;
  final bool showPrefix;
  final Color color;

  final Border border;
  const Header({
    Key key,
    this.text,
    this.color,

    this.border,
    this.showPrefix = true,
    this.textStyle,
    this.suffix,
    this.backgroundColor,

    this.preferredActionOnBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
                color: backgroundColor ?? Color(0xffF2E7E6),
                borderRadius: BorderRadius.circular(16),
                border: border
            ),
            child: Icon(
              Icons.arrow_back_ios_rounded,
              color: color,
              size: 15,
            ),
          ),
          onTap: preferredActionOnBackPressed ??
                  () {
                pop(context);
              },
        ),
        Spacer(),
        Text(
          text,
          style: textStyle ??  TextStyle(
            color: color ?? brown,
            fontWeight: FontWeight.w700,
            fontSize: 21,
          ),
        ),
        Spacer(),
        suffix ?? Icon(Icons.more_vert, color: Colors.transparent,)
        // Opacity(
        //   opacity: 0,
        //   child: IconButton(
        //     icon: Icon(
        //       Icons.arrow_back_ios,
        //       size: 18,
        //     ),
        //     onPressed: null,
        //   ),
        // ),
      ],
    );
  }
}
