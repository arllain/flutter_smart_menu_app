import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_menu_app/layers/domain/entities/product/product_entity.dart';
import 'package:smart_menu_app/layers/presentation/pages/cart_page/bloc/cart_bloc.dart';
import 'package:smart_menu_app/layers/presentation/pages/cart_page/cart_page.dart';
import 'package:smart_menu_app/layers/presentation/pages/home/home_page.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  int _productQuantity = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    CartPage(),
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
      bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          sumProductQuantity(state.cartList);
          return BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTaped,
            elevation: 10,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: Colors.blueGrey,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: const Color(0xFF526480),
            items: [
              const BottomNavigationBarItem(
                  icon: Icon(FluentIcons.home_16_regular),
                  activeIcon: Icon(FluentIcons.home_16_filled),
                  label: "Home"),
              BottomNavigationBarItem(
                icon: Badge(
                  showBadge: _productQuantity > 0,
                  position: BadgePosition.topEnd(top: -7, end: -6),
                  animationDuration: const Duration(milliseconds: 300),
                  animationType: BadgeAnimationType.slide,
                  badgeContent: Text(
                    _productQuantity > 0 ? _productQuantity.toString() : '',
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                  child: const Icon(
                    FluentIcons.cart_16_regular,
                    size: 25,
                  ),
                ),
                activeIcon: Badge(
                  showBadge: _productQuantity > 0,
                  position: BadgePosition.topEnd(top: -7, end: -6),
                  animationDuration: const Duration(milliseconds: 300),
                  animationType: BadgeAnimationType.slide,
                  badgeContent: Text(
                    _productQuantity > 0 ? _productQuantity.toString() : '',
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                  child: const Icon(
                    FluentIcons.cart_16_filled,
                    size: 25,
                  ),
                ),
                label: "Cart",
              ),
              const BottomNavigationBarItem(
                  icon: Icon(
                    FluentIcons.person_16_regular,
                  ),
                  activeIcon: Icon(
                    FluentIcons.person_16_filled,
                  ),
                  label: "Profile"),
            ],
          );
        },
      ),
    );
  }

  sumProductQuantity(Map<ProductEntity, int> cartList) {
    _productQuantity = 0;
    for (var element in cartList.entries) {
      _productQuantity = _productQuantity + element.value;
    }
  }
}
