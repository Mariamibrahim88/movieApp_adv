import 'package:flutter/material.dart';
import 'package:movie_app_adv/features/category/presentation/views/category_view.dart';
import 'package:movie_app_adv/features/home/presentation/views/home_view.dart';

class Nav extends StatefulWidget {
  @override
  State<Nav> createState() => Nav_State();
}

class Nav_State extends State<Nav> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const HomeView(),
    const CategoryView(),
    // CardListView(),
  ];
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('NewsApp'),
      // ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        unselectedFontSize: 14,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon:
                Icon(Icons.home, color: Color.fromARGB(255, 110, 171, 112)),
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: 'Tvs',
          ),
          BottomNavigationBarItem(
            activeIcon:
                Icon(Icons.category, color: Color.fromARGB(255, 110, 171, 112)),
            icon: Icon(Icons.category, color: Colors.white),
            label: 'Category',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        selectedItemColor: Colors.white,
      ),
    );
  }
}
