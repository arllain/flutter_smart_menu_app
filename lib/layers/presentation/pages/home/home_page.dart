import 'package:flutter/material.dart';
import 'package:smart_menu_app/layers/presentation/pages/home/home_layout.dart';
import 'package:smart_menu_app/layers/presentation/utils/app_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: const HomeLayout(),
    );
  }
}
