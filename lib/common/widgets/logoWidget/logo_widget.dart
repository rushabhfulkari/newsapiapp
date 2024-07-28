import 'package:flutter/material.dart';
import 'package:newsapiapp/core/configs/theme/app_colors.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "MyNews",
      style: TextStyle(
          color: AppColors.primaryBlue,
          fontFamily: "Poppins",
          fontSize: 50,
          fontWeight: FontWeight.bold),
    );
  }
}
