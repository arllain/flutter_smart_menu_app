import 'package:flutter/material.dart';
import 'package:smart_menu_app/layers/presentation/utils/app_layout.dart';
import 'package:smart_menu_app/layers/presentation/utils/app_styles.dart';

class TabBarButton extends StatefulWidget {
  final List<Map<String, dynamic>> categories;
  const TabBarButton({Key? key, required this.categories}) : super(key: key);

  @override
  State<TabBarButton> createState() => _TabBarButtonState();
}

class _TabBarButtonState extends State<TabBarButton> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.categories.asMap().keys.toList().map((index) {
        bool selected = index == selectedIndex;
        return InkWell(
          splashColor: Colors.transparent,
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            height: AppLayout.getHeight(44),
            padding: const EdgeInsets.symmetric(horizontal: 19.0),
            decoration: BoxDecoration(
              color: selected ? Styles.yellowColor : Colors.transparent,
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Center(
              child: Text(
                widget.categories[index]['name'],
                style: selected
                    ? Styles.tabButtonS
                    : Styles.tabButtonU.copyWith(
                        shadows: [
                          Shadow(
                              color: Styles.black.withOpacity(0.2),
                              offset: const Offset(5, 5),
                              blurRadius: 15)
                        ],
                      ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
