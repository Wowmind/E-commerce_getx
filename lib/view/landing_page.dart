import 'package:dolce/view/home_page.dart';
import 'package:dolce/view/pages/alert.dart';
import 'package:dolce/view/pages/profile.dart';
import 'package:dolce/view/pages/search.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          bottomNavigationBar: menu(),
          body: TabBarView(
            children: [
              HomePage(),
             Search(),
              Alertt(),
              Profile(),
            ],
          ),
        ),
      ),
    );
  }

  Widget menu() {
    return Container(
      color: Colors.white,
      child: const TabBar(
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Colors.deepPurple,
        tabs: [
          Tab(
            text: "Home",
            icon: Icon(Icons.home),
          ),
          Tab(
            text: "Search",
            icon: Icon(Icons.search),
          ),
          Tab(
            text: "Cart",
            icon: Icon(Icons.notification_important_outlined,),
          ),
          Tab(
            text: "Profile",
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
