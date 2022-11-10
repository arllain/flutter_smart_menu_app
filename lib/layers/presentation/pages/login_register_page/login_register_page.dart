import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:gap/gap.dart';
import 'package:localization/localization.dart';
import 'package:smart_menu_app/layers/presentation/auth/bloc/auth_bloc.dart';
import 'package:smart_menu_app/layers/presentation/utils/app_layout.dart';
import 'package:smart_menu_app/layers/presentation/utils/app_styles.dart';

class LoginRegisterPage extends StatelessWidget {
  const LoginRegisterPage({super.key});

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
        height: AppLayout.getHeight(500),
        padding: const EdgeInsets.all(20.0),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Gap(10),
            Text(
              '${'get_started'.i18n()} 😁',
              style:
                  const TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            const Gap(15),
            Center(
              child: Text(
                'sign_or_login_msg'.i18n(),
                style: Styles.textStyle
                    .copyWith(color: Styles.greyColor, fontSize: 13),
              ),
            ),
            const Gap(5),
            Text(
              'sign_or_login_msg_complement'.i18n(),
              style: Styles.textStyle
                  .copyWith(color: Styles.greyColor, fontSize: 13),
            ),
            const Gap(100),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SignInButton(
                    Buttons.Google,
                    text: 'signup_google'.i18n(),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    onPressed: () {
                      context.read<AuthBloc>().add(UserSignInEvent());
                    },
                    mini: false,
                  ),
                  SignInButton(
                    Buttons.Facebook,
                    text: 'signup_facebook'.i18n(),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    onPressed: () {},
                  ),
                  SignInButton(
                    Buttons.Email,
                    text: 'signup_email'.i18n(),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    onPressed: () {},
                  ),
                  const Gap(120),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
