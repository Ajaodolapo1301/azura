import 'package:after_layout/after_layout.dart';
import 'package:azura_lab/core/styles/color_utils.dart';
import 'package:azura_lab/core/styles/fontSize.dart';
import 'package:azura_lab/feature/home/domain/entities/sport_entity.dart';
import 'package:azura_lab/feature/home/presentation/view_model/sport_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>
    with TickerProviderStateMixin, AfterLayoutMixin<Home> {
  TabController controller;

  int selectedIndex = 0;
  PageController pageController = PageController();
  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  SportState sportState;

  bool error = false;
  @override
  Widget build(BuildContext context) {
      sportState = Provider.of<SportState>(context);

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.menu),
                    Text(
                      "Azura Labs",
                      style: kBold700.copyWith(fontSize: 20.sp),
                    ),
                    Icon(Icons.search),
                  ],
                ),
              ),
              SizedBox(height: 25.h),
    sportState.busy ? Text("Loading ..") :          Container(
                // padding: EdgeInsets.symmetric(horizontal: 15),
                height: 35.h,

                child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 0);
                    },
                    itemCount: sportState.sport.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      Sport sport = sportState.sport[index];
                      return InkWell(
                        onTap: () {
                          HapticFeedback.lightImpact();
                          setState(() {
                            selectedIndex = index;
                            pageController.animateToPage(
                              selectedIndex,
                              duration: Duration(milliseconds: 200),
                              curve: Curves.ease,
                            );
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 15.w),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            padding: EdgeInsets.only(right: 20, left: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: selectedIndex == index
                                    ? red
                                    : Colors.transparent,
                                border: Border.all(
                                    width: 1,
                                    color: selectedIndex == index
                                        ? Colors.transparent
                                        : red.withOpacity(0.4))),
                            child: Center(
                                child: Text(
                                 sport.strSport,
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      color: selectedIndex == index
                                          ? Colors.white
                                          : red,
                                      fontWeight: FontWeight.w600),
                                )),
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 20.h,
              ),

            ],
          ),
        ),
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {

    fetchSport();

  }

  void fetchSport() async {
    var result = await sportState.getSport();
        result.fold((l) {
          setState(() {
            error = true;
          });
        }, (r) {

        });
    }



  }



  // void fetchLeagues({sport, country}) async {
  //   var res = await SportApi().getLeaguesByCoutry(sport: sport, country: country);
  //   if (res["error"] == false && res["leagues"] !=  null) {
  //     setState(() {
  //       leagues = res["leagues"];
  //     });
  //     pushTo(context, LeaguePage(leagues: leagues,));
  //   }

  // }

