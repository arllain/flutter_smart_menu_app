import 'package:flutter/material.dart';
import 'package:smart_menu_app/layers/presentation/utils/app_styles.dart';
import 'package:localization/localization.dart';
import 'package:smart_menu_app/main.dart';

class EnjoyPage extends StatelessWidget {
  final String msng;
  const EnjoyPage({super.key, required this.msng});

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
            //const SizedBox(height: 60),
            Text(
              msng,
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Styles.greyColor),
            ),
            const SizedBox(height: 60),
            const Image(
              image: AssetImage('assets/images/peace-img.png'),
              //image: AssetImage('assets/images/qr-code-scan.png'),
              width: 100,
              height: 100,
            ),
            const SizedBox(
              height: 150.0,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyApp(),
                  ),
                );
              },
              height: 50,
              elevation: 0,
              splashColor: Styles.buttonSplahColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Styles.buttonColor,
              child: Center(
                child: Text(
                  'back_home'.i18n(),
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
