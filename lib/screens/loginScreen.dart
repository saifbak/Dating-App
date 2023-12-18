import 'package:datingapp/models/businessLayer/baseRoute.dart';
import 'package:datingapp/models/businessLayer/global.dart' as g;
import 'package:datingapp/screens/verifyOtpScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:country_list_pick/country_list_pick.dart';

class LoginScreen extends BaseRoute {
  LoginScreen({a, o}) : super(a: a, o: o, r: 'LoginScreen');
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseRouteState {
  TextEditingController _cContactNo = new TextEditingController();

  var _scaffoldKey = GlobalKey<ScaffoldState>();

  _LoginScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: g.scaffoldBackgroundGradientColors,
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          key: _scaffoldKey,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Center(
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      AppLocalizations.of(context).lbl_login,
                      style: Theme.of(context).primaryTextTheme.headline1,
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context).lbl_login_subtitle1,
                    style: Theme.of(context).primaryTextTheme.subtitle2,
                  ),
                  Text(
                    AppLocalizations.of(context).lbl_login_subtitle2,
                    style: Theme.of(context).primaryTextTheme.subtitle2,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    padding: EdgeInsets.all(1.5),
                    height: 55,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: g.gradientColors,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: g.isDarkModeEnable
                            ? Colors.black
                            : Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(35),
                      ),
                      height: 55,
                      child: InternationalPhoneNumberInput(
                        onInputChanged: (PhoneNumber number) {
                          print(number.phoneNumber);
                        },
                        onInputValidated: (bool value) {
                          print(value);
                        },
                        selectorConfig: SelectorConfig(
                          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                        ),
                        ignoreBlank: false,
                        autoValidateMode: AutovalidateMode.disabled,
                        selectorTextStyle: TextStyle(color: Colors.black),
                        formatInput: false,
                        keyboardType: TextInputType.numberWithOptions(
                            signed: true, decimal: true),
                        inputBorder: OutlineInputBorder(),
                        onSaved: (PhoneNumber number) {
                          print('On Saved: $number');
                        },
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 150,
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
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => VerifyOtpScreen(
                                  a: widget.analytics,
                                  o: widget.observer,
                                )));
                      },
                      child: Text(
                        AppLocalizations.of(context).btn_submit,
                        style: Theme.of(context)
                            .textButtonTheme
                            .style
                            .textStyle
                            .resolve({
                          MaterialState.pressed,
                        }),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25, bottom: 20),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.all(15),
                          height: 0.5,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: g.gradientColors,
                            ),
                          ),
                          child: Divider(),
                        ),
                        Container(
                            margin: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: Color(0xFF3F1444),
                              ),
                            ),
                            child: g.isDarkModeEnable
                                ? CircleAvatar(
                                    radius: 24,
                                    backgroundColor: Colors.black,
                                    child: Text(
                                      AppLocalizations.of(context).lbl_or,
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .subtitle2,
                                    ),
                                  )
                                : CircleAvatar(
                                    radius: 24,
                                    backgroundColor: Colors.white,
                                    child: Text(
                                      AppLocalizations.of(context).lbl_or,
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .subtitle2,
                                    ),
                                  ))
                      ],
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context).lbl_login_using,
                    style: Theme.of(context).primaryTextTheme.headline3,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Color(0xFF2942C7),
                          child: Text(
                            'f',
                            style: Theme.of(context).accentTextTheme.headline2,
                          ),
                        ),
                        Padding(
                          padding: g.isRTL
                              ? const EdgeInsets.only(right: 15)
                              : const EdgeInsets.only(left: 15),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Color(0xFFDF4D5F),
                            child: Text(
                              'G',
                              style:
                                  Theme.of(context).accentTextTheme.headline2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    ));
  }

  @override
  void initState() {
    super.initState();
  }
}
