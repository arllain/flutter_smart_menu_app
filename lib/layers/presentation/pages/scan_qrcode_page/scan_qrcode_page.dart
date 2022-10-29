import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_menu_app/layers/presentation/pages/cart_page/bloc/cart_bloc.dart';
import 'package:smart_menu_app/layers/presentation/pages/home/home_page.dart';
import 'package:smart_menu_app/layers/presentation/utils/app_styles.dart';
import 'package:localization/localization.dart';
import 'package:smart_menu_app/main.dart';

class ScanQrCodePage extends StatelessWidget {
  const ScanQrCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            Text(
              'last_step_to_get_your_order'.i18n(),
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            const Image(
              image: AssetImage('assets/images/qr-code-scan.png'),
              width: 220,
            ),
            const SizedBox(height: 40),
            Text(
              'please_scan_qr_code_when'.i18n(),
              style: Styles.textStyle
                  .copyWith(color: Styles.greyColor, fontSize: 15),
            ),
            const SizedBox(height: 5),
            Text(
              'your_order_arrives'.i18n(),
              style: Styles.textStyle
                  .copyWith(color: Styles.greyColor, fontSize: 15),
            ),
            const SizedBox(
              height: 70.0,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<HomePage>(
                    builder: ((context) => const MyApp()),
                  ),
                );
              },
              height: 50,
              elevation: 0,
              child: Center(
                child: Text(
                  'scan_later'.i18n(),
                  style: Styles.headLineStyle2
                      .copyWith(color: Styles.greyColor, fontSize: 18),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            MaterialButton(
              onPressed: () {},
              height: 50,
              elevation: 0,
              splashColor: Styles.buttonSplahColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Styles.buttonColor,
              child: Center(
                child: Text(
                  'scan_now'.i18n(),
                  style: Styles.headLineStyle2
                      .copyWith(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
