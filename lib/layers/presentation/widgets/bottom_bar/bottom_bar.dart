import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:smart_menu_app/layers/presentation/pages/home/home_page.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const Text("Cart"),
    const Text("Profile"),
  ];

  void _onItemTaped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTaped,
          elevation: 10,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.blueGrey,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: const Color(0xFF526480),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(FluentIcons.home_16_regular),
                activeIcon: Icon(FluentIcons.home_16_filled),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(FluentIcons.cart_16_regular),
                activeIcon: Icon(FluentIcons.cart_16_filled),
                label: "Cart"),
            BottomNavigationBarItem(
                icon: Icon(FluentIcons.person_16_regular),
                activeIcon: Icon(FluentIcons.person_16_filled),
                label: "Profile")
          ]),
    );
  }
}
