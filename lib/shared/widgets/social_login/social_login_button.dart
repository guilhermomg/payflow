import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({Key? key, required this.onTap}) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
            color: AppColors.shape,
            borderRadius: BorderRadius.circular(5),
            border: Border.fromBorderSide(BorderSide(color: AppColors.stroke))),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                    child: Center(
                      child: Image.asset(AppImages.google),
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                          right:
                              BorderSide(width: 1.0, color: AppColors.stroke)),
                    ))),
            Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Entrar com Google",
                    style: TextStyles.buttonGray,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
