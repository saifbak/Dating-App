import 'package:datingapp/models/businessLayer/baseRoute.dart';
import 'package:datingapp/models/businessLayer/global.dart' as g;
import 'package:datingapp/screens/planDatingScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ViewPlanScreen extends BaseRoute {
  ViewPlanScreen({a, o}) : super(a: a, o: o, r: 'ViewPlanScreen');
  @override
  _ViewPlanScreenState createState() => _ViewPlanScreenState();
}

class _ViewPlanScreenState extends BaseRouteState {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  _ViewPlanScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
        return new Future(() => false);
      },
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset(
                    g.isDarkModeEnable ? 'assets/images/subscription_dark.png' : 'assets/images/subscription_light.png',
                  ),
                ),
                Text(
                  AppLocalizations.of(context).lbl_hello_user,
                  style: Theme.of(context).textTheme.headline1,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'To continue with this option please\nchoose a subsciption plan that suits\nyou & get the most out of the app',
                    style: Theme.of(context).primaryTextTheme.subtitle2,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 50,
                    width: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: g.gradientColors,
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => PlanDatingScreen(
                                  a: widget.analytics,
                                  o: widget.observer,
                                )));
                      },
                      child: Text(AppLocalizations.of(context).btn_view_plan,
                          style: Theme.of(context).textButtonTheme.style.textStyle.resolve({
                            MaterialState.pressed,
                          })),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }

  @override
  void initState() {
    super.initState();
  }
}
