import 'package:after_layout/after_layout.dart';
import 'package:azura_lab/core/navigation/navigator.dart';
import 'package:azura_lab/core/navigation/route_generator.dart';
import 'package:azura_lab/core/styles/color_utils.dart';
import 'package:azura_lab/core/styles/fontSize.dart';
import 'package:azura_lab/core/widget/loading_overlay_widget.dart';
import 'package:azura_lab/feature/home/domain/entities/country_entity.dart';
import 'package:azura_lab/feature/home/domain/entities/sport_entity.dart';
import 'package:azura_lab/feature/home/presentation/view_model/sport_view_model.dart';
import 'package:azura_lab/feature/home/presentation/widget/country_widget.dart';
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


  int selectedIndex = 0;
  PageController pageController = PageController();
  @override
  void initState() {

    super.initState();
  }

  SportState sportState;

  List<Country> filteredList = [];
  bool error = false;
  @override
  Widget build(BuildContext context) {

      sportState = Provider.of<SportState>(context);
      if (filteredList.isEmpty) {
        setState(() {
          filteredList =  sportState.country;
        });
      }
    return LoadingOverlayWidget(
        loading: sportState.busy,
      child: Scaffold(
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
                Expanded(
                    child: PageView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: pageController,
                      children: sportState.sport.map((e) {
                        if (e.strSport == "Soccer") {
                          return Container(
                            padding: EdgeInsets.only(left: 20),
                            child: ListView.separated(
                              itemCount: filteredList.length,
                              separatorBuilder: (context, index){
                                // Country country = filteredList[index];
                                return Divider(height: 10,);
                              },
                              itemBuilder: (context, index){
                                Country country = filteredList[index];
                                return CountryWidget(country: country, onTap: (){

                                  fetchLeagues(sport:e.strSport, country: country.nameEn );
                                },);
                              },
                            ),
                          );
                        } else {
                          return Text("hooray");
                        }
                      }).toList(),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {

    fetchSport();
  fetchCountry();
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


  void fetchLeagues({sport, country}) async {
    var res = await sportState.getLeaguesByCountry(sport: sport, country: country);
    res.fold((l) => null, (r) {

      pushNamedRoute(context, leaguesPage, args: r );

    });

  }


  void fetchCountry() async {
    var res = await sportState.getCountry();
    // print(res);
  }

  }





