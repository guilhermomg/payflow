import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/social_login/social_login_button.dart';

import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.35,
              color: AppColors.primary,
            ),
            Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Center(
                          child: Image.asset(AppImages.person,
                              height: size.height * 0.46),
                        ),
                        Container(
                          height: size.height * 0.47,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            gradient: LinearGradient(
                              begin: FractionalOffset.topCenter,
                              end: FractionalOffset.bottomCenter,
                              colors: [
                                AppColors.background.withOpacity(0.0),
                                AppColors.background,
                              ],
                              stops: const [0.6, 0.92],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(child: Container()),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24.0),
                        child: Image.asset(AppImages.logomini)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 70.0),
                      child: Text(
                        "Organize seus boletos em um só lugar",
                        textAlign: TextAlign.center,
                        style: size.height < 700
                            ? TextStyles.titleRegular
                            : TextStyles.titleHome,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(size.height < 700 ? 16.0 : 40.0),
                      child: SocialLoginButton(
                        onTap: () => controller.googleSignIn(context),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
