import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:smart_menu_app/layers/presentation/utils/app_layout.dart';
import 'package:smart_menu_app/layers/presentation/utils/app_styles.dart';

class SearchInputWidget extends StatelessWidget {
  const SearchInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            height: (AppLayout.getHeight(40)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: AppLayout.getWidth(258),
                  child: TextField(
                    style: TextStyle(color: Styles.white),
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color: Styles.lightGrey),
                        prefixIcon: Icon(Icons.search, color: Styles.lightGrey),
                        hintText: 'search'.i18n(),
                        border: InputBorder.none),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Image.asset(
                    'assets/icons/adjust.png',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
