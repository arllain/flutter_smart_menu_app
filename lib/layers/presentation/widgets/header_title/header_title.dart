import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:smart_menu_app/layers/presentation/utils/app_styles.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Text(
        'choose-the-best-for-you'.i18n(),
        style: Styles.headLineStyle2.copyWith(
          shadows: [
            Shadow(
                color: Styles.black.withOpacity(0.3),
                offset: const Offset(5, 5),
                blurRadius: 15)
          ],
        ),
      ),
    );
  }
}
