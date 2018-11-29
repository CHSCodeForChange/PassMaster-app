import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/pass.dart';
import '../models/currentuser.dart';

class PassMini extends StatelessWidget {
  PassModel pass;
  CurrentUserModel user;

  PassMini(this.pass, this.user);

  @override
  Widget build(BuildContext context) {
    return new Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: new Container(
        padding: EdgeInsets.only(top: 15.0, bottom: 15.0, left: 20.0, right: 20.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Container(
                  child: this.pass.getIcon(childIcon: true),
                  padding: EdgeInsets.only(right: 10.0),
                ),
                new Text(
                  pass.getName(user) ?? "Type Error",
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: pass.getName(user) == null ? Colors.red : Colors.black),
                ),
              ],
            ),

            new Text(
              pass.getDateDuration(showYear: false, shortenedMonths: true),
              style: TextStyle(fontSize: 17.0),
            )
          ],
        ),
      ),
    );
  }
}