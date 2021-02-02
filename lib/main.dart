// import 'package:cctracker/CCList.dart';
import 'package:flutter/material.dart';

import 'main_page.dart';

void main() => runApp(CCTracker());

class CCTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Криптовалюты',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: ListCrypto());
  }
}
