import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:smart_menu_app/layers/presentation/pages/qrcode_page/qrcode_page.dart';
import 'package:smart_menu_app/layers/presentation/utils/app_styles.dart';

class PaymentSuccessPage extends StatelessWidget {
  const PaymentSuccessPage({super.key});

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
            const Image(
              image: AssetImage('assets/images/wallet.png'),
              width: 150,
            ),
            const SizedBox(height: 20),
            Text(
              'payment_success'.i18n(),
              style:
                  const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              'thank_you_for_your_payment'.i18n(),
              style: Styles.textStyle
                  .copyWith(color: Styles.greyColor, fontSize: 12),
            ),
            const SizedBox(
              height: 180.0,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QrCodePage(),
                    ));
              },
              height: 50,
              elevation: 0,
              splashColor: Styles.buttonSplahColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Styles.buttonColor,
              child: Center(
                child: Text(
                  'continue'.i18n(),
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
