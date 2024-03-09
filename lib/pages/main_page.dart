import 'package:aplikasiuangko/pages/category_page.dart';
import 'package:aplikasiuangko/pages/home_page.dart';
import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> children = [HomePage(), CategoryPage()];
  int CurrentIndex = 0;
  void OnTapTapped(int index) {
    setState(() {
      CurrentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (CurrentIndex == 0)
          ? CalendarAppBar(
              accent: Colors.blue,
              backButton: false,
              locale: 'id',
              onDateChanged: (value) => print(value),
              firstDate: DateTime.now().subtract(Duration(days: 140)),
              lastDate: DateTime.now(),
            )
          : PreferredSize(
              preferredSize: Size.fromHeight(100),
              child: Container(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 36, horizontal: 16),
                  child: Text(
                    'Categories',
                    style: GoogleFonts.montserrat(fontSize: 20),
                  ),
                ),
              )),
      floatingActionButton: Visibility(
        visible: (CurrentIndex == 0) ? true : false,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.blue,
          child: Icon(Icons.add),
        ),
      ),
      body: children[CurrentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  OnTapTapped(0);
                },
                icon: Icon(Icons.home)),
            SizedBox(
              width: 20,
            ),
            IconButton(
                onPressed: () {
                  OnTapTapped(1);
                },
                icon: Icon(Icons.list)),
          ],
        ),
      ),
    );
  }
}
