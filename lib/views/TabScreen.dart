import 'package:flutter/material.dart';
import 'package:todo_list/constants.dart';
import 'package:todo_list/views/About.dart';
import 'package:todo_list/views/HomePage.dart';

class TabScreen extends StatefulWidget {
  TabScreenState createState() => TabScreenState();
}

class TabScreenState extends State<TabScreen> {
  final List<Widget> pages = [HomePage(), About()];
  int selectedIndex = 0;

  void selectTab(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(Constants.APP_TITLE),
        ),
        body: pages[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: selectedIndex,
          onTap: selectTab,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title: Text("To-Do"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              title: Text("About Us"),
            )
          ],
        ));
  }
}
