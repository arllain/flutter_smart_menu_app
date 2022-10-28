import 'package:flutter/material.dart';
import 'package:smart_menu_app/layers/presentation/utils/app_styles.dart';

class ScanQrCodePage extends StatelessWidget {
  const ScanQrCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back),
          iconSize: 20.0,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'The last step to get your order',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            const Image(
              image: AssetImage('assets/images/qr-code-scan.png'),
              width: 220,
            ),
            const SizedBox(height: 40),
            Text(
              'Please scan the QR Code when',
              style: Styles.textStyle
                  .copyWith(color: Styles.greyColor, fontSize: 15),
            ),
            const SizedBox(height: 5),
            Text(
              'your order arrives.',
              style: Styles.textStyle
                  .copyWith(color: Styles.greyColor, fontSize: 15),
            ),
            const SizedBox(
              height: 70.0,
            ),
            MaterialButton(
              onPressed: () {},
              height: 50,
              elevation: 0,
              child: Center(
                child: Text(
                  'Scan later',
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
                  'Scan now',
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
