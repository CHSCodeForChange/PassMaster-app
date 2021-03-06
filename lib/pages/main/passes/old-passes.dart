import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';

import '../../../fragments/pass-list.dart';
import '../../../api/pass_list.dart';
import '../../../models/pass.dart';
import '../../../models/currentuser.dart';

class OldPasses extends StatefulWidget {
  CurrentUserModel user;

  OldPasses(this.user);

  @override
  OldPassesState createState() => new OldPassesState(user);

}

class OldPassesState extends State<OldPasses> {
  CurrentUserModel user;
  PassList list;

  OldPassesState(this.user);

  @override 
  void initState() {
    list = new PassList(null, user);
    getData();
  }

  Future<void> getData() async {
    Iterable<PassModel> passes = await PassListAPI().getData(user.token, listType: "student-old");
    list.state.setState(() {
      list.state.passes = passes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return list;
  }
}