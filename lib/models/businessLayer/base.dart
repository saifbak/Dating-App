import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Base extends StatefulWidget {
  final dynamic analytics;
  final dynamic observer;
  final String routeName;

  Base({Key key, this.analytics, this.observer, this.routeName}) : super(key: key);

  @override
  BaseState createState() => BaseState();
}

class BaseState extends State<Base> with TickerProviderStateMixin, WidgetsBindingObserver {
  BaseState();

  Widget build(BuildContext context) => null;

  @override
  void initState() {
    super.initState();
  }

  Future exitAppDialog() async {
    try {
      showCupertinoDialog(
          context: context,
          builder: (BuildContext context) {
            return Theme(
              data: ThemeData(dialogBackgroundColor: Colors.white),
              child: CupertinoAlertDialog(
                title: Text(
                  "Exit app",
                  style: TextStyle(color: Color(0xFF33196B), fontSize: 16),
                ),
                content: Text(
                  "Are you sure you want to exit app?",
                ),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.red),
                    ),
                    onPressed: () {
                      return Navigator.of(context).pop(false);
                    },
                  ),
                  CupertinoDialogAction(
                    child: Text(
                      "Exit",
                      style: TextStyle(color: Color(0xFF33196B), fontSize: 14),
                    ),
                    onPressed: () async {
                      exit(0);
                    },
                  ),
                ],
              ),
            );
          });
    } catch (e) {
      print('Exception - base.dart - exitAppDialog(): ' + e.toString());
    }
  }
}
