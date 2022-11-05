import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_menu_app/layers/presentation/auth/bloc/auth_bloc.dart';
import 'package:smart_menu_app/layers/presentation/widgets/bottom_bar/bottom_bar.dart';

class HandleUserSignOut extends StatelessWidget {
  const HandleUserSignOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(UserSignOutEvent());
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return BottomBar(selectedIndex: 0);
      },
    );
  }
}
