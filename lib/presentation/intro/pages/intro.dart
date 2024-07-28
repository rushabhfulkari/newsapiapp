import 'package:flutter/material.dart';
import 'package:newsapiapp/common/widgets/button/basic_app_button.dart';
import 'package:newsapiapp/common/widgets/logoWidget/logo_widget.dart';
import 'package:newsapiapp/core/configs/theme/app_colors.dart';
import 'package:newsapiapp/presentation/auth/pages/signup_or_signin.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
        child: Column(
          children: [
            const Spacer(),
            const LogoWidget(),
            const Spacer(),
            const Text(
              'Top business headlines in the Country right now',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.secondaryBlue,
                  fontSize: 18),
            ),
            const SizedBox(
              height: 21,
            ),
            Text(
              "Stay updated with the latest developments in the business world, featuring key economic trends, market movements, and corporate news shaping the nation's economy today.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.secondaryBlue.withOpacity(0.5),
                  fontSize: 13),
            ),
            const SizedBox(
              height: 20,
            ),
            BasicAppButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const SignupOrSigninPage()));
                },
                title: "Get Started")
          ],
        ),
      ),
    );
  }
}
