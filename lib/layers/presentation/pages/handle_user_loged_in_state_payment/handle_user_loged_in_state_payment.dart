import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_menu_app/layers/presentation/auth/bloc/auth_bloc.dart';
import 'package:smart_menu_app/layers/presentation/pages/login_register_page/login_register_page.dart';
import 'package:smart_menu_app/layers/presentation/pages/payment_page/payment_page.dart';

class HandleUserSignedInStatePayment extends StatelessWidget {
  const HandleUserSignedInStatePayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state.user != null) {
          return const PaymentPage();
        } else {
          return const LoginRegisterPage();
        }
      },
    );
  }
}
