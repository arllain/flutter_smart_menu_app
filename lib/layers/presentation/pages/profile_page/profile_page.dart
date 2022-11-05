import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:gap/gap.dart';
import 'package:localization/localization.dart';
import 'package:smart_menu_app/layers/presentation/auth/bloc/auth_bloc.dart';
import 'package:smart_menu_app/layers/presentation/pages/handle_auth_state_profile/handle_auth_state_profile.dart';
import 'package:smart_menu_app/layers/presentation/pages/handle_user_sign_out/handle_user_sign_out.dart';
import 'package:smart_menu_app/layers/presentation/utils/app_layout.dart';
import 'package:smart_menu_app/layers/presentation/utils/app_styles.dart';
import 'package:smart_menu_app/layers/presentation/widgets/message_display/message_display.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state.status.isLoading) {
            return Center(
              child: SizedBox(
                height: AppLayout.getHeight(150),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          } else if (state.status.isSuccess) {
            var currentUser = state.user;
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 55),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        getButtonLoginLogout(currentUser != null, context),
                      ],
                    ),
                    Gap(AppLayout.getHeight(10)),
                    Text(
                      'my_profile'.i18n(),
                      style: Styles.headLineStyle2.copyWith(
                        fontSize: 25,
                        shadows: [
                          Shadow(
                              color: Styles.black.withOpacity(0.3),
                              offset: const Offset(5, 5),
                              blurRadius: 15)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: AppLayout.getHeight(220),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          double innerHeight = constraints.maxHeight;
                          double innerWidth = constraints.maxWidth;
                          return Stack(
                            fit: StackFit.expand,
                            children: [
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: innerHeight * 0.72,
                                  width: innerWidth,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      Gap(AppLayout.getHeight(60)),
                                      Text(
                                        currentUser?.displayName ?? '',
                                        style: const TextStyle(
                                          color:
                                              Color.fromRGBO(39, 105, 171, 1),
                                          fontSize: 27,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          currentUser == null
                                              ? Container()
                                              : Column(
                                                  children: [
                                                    Text(
                                                      'orders_qtd'.i18n(),
                                                      style: TextStyle(
                                                        color: Styles
                                                            .darkGreyColor,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                    Text(
                                                      '10',
                                                      style: TextStyle(
                                                        color: Styles
                                                            .darkGreyColor,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                          currentUser == null
                                              ? Container()
                                              : Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 25,
                                                    vertical: 8,
                                                  ),
                                                  child: Container(
                                                    height: 50,
                                                    width: 3,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                      color: Styles.greyColor,
                                                    ),
                                                  ),
                                                ),
                                          currentUser == null
                                              ? Container()
                                              : Column(
                                                  children: [
                                                    Text(
                                                      'orders_pending'.i18n(),
                                                      style: TextStyle(
                                                        color: Styles
                                                            .darkGreyColor,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                    Text(
                                                      '1',
                                                      style: TextStyle(
                                                        color: Styles
                                                            .darkGreyColor,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 75,
                                right: 20,
                                child: currentUser == null
                                    ? Container()
                                    : Icon(
                                        AntDesign.setting,
                                        color: Styles.darkGreyColor,
                                        size: 30,
                                      ),
                              ),
                              Positioned(
                                top: 25,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: getProfileImage(
                                      currentUser?.photoURL ?? '', innerWidth),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    Gap(AppLayout.getHeight(10)),
                    currentUser != null
                        ? Container(
                            height: height * 0.5,
                            width: width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                children: [
                                  const Gap(20),
                                  Text(
                                    'my_orders'.i18n(),
                                    style: const TextStyle(
                                      color: Color.fromRGBO(39, 105, 171, 1),
                                      fontSize: 27,
                                    ),
                                  ),
                                  const Divider(
                                    thickness: 2.5,
                                  ),
                                  const Gap(10),
                                  Container(
                                    height: height * 0.15,
                                    decoration: BoxDecoration(
                                      color: Styles.greyColor,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  const Gap(10),
                                  Container(
                                    height: height * 0.15,
                                    decoration: BoxDecoration(
                                      color: Styles.greyColor,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Container()
                  ],
                ),
              ),
            );
          } else {
            return MessageDisplay(message: state.message);
          }
        },
      ),
    );
  }

  getProfileImage(String photoPath, double innerWidth) {
    if (photoPath != '') {
      return Image.network(
        photoPath,
        fit: BoxFit.fitWidth,
        width: innerWidth * 0.30,
      );
    }
    return Image.asset(
      'assets/images/profile.png',
      width: innerWidth * 0.30,
      fit: BoxFit.fitWidth,
    );
  }

  getButtonLoginLogout(bool userLoggin, BuildContext context) {
    if (userLoggin) {
      return GestureDetector(
        child: Icon(
          MaterialCommunityIcons.logout,
          color: Styles.orangeColor2,
          size: 30,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HandleUserSignOut(),
            ),
          );
        },
      );
    } else {
      return GestureDetector(
        child: Icon(
          MaterialCommunityIcons.login,
          color: Styles.black,
          size: 30,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HandleAuthStateProfile(),
            ),
          );
        },
      );
    }
  }
}
