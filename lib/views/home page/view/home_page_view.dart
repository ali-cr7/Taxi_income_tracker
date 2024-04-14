import 'package:flutter/material.dart';
import 'package:taxi_app/views/home%20page/widgets/custom_drawer.dart';
import 'package:taxi_app/views/home%20page/widgets/home_page_body.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFF7F9FA),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFFFAFAFA),
          leading: IconButton(
              onPressed: () {
                scaffoldKey.currentState!.openDrawer();
              },
              icon: const Icon(Icons.menu)),
        ),
        body: const Padding(
          padding: EdgeInsets.all(8.0),
          child: HomePageBody(),
        ),
        drawer: const CustomDrawer(),
      ),
    );
  }
}
