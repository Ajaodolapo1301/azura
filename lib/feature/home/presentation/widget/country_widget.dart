
import 'package:azura_lab/core/styles/fontSize.dart';
import 'package:azura_lab/feature/home/domain/entities/country_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CountryWidget extends StatelessWidget {
 final Country country;
final  VoidCallback onTap;
  CountryWidget({Key key, this.country, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            country.nameEn,
            style: kBold500.copyWith(fontSize: 15.sp),
          ),
          IconButton(
              icon: Icon(Icons.keyboard_arrow_right),
              onPressed: null)
        ],
      ),
    );
  }
}