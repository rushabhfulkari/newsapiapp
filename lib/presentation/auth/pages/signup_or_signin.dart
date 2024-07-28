import 'package:flutter/material.dart';
import 'package:newsapiapp/common/widgets/appbar/app_bar.dart';
import 'package:newsapiapp/common/widgets/button/basic_app_button.dart';
import 'package:newsapiapp/core/configs/theme/app_colors.dart';
import 'package:newsapiapp/presentation/auth/pages/signin.dart';
import 'package:newsapiapp/presentation/auth/pages/signup.dart';

class SignupOrSigninPage extends StatelessWidget {
  const SignupOrSigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BasicAppbar(
              title: Text(
            "MyNews",
            style: TextStyle(
                color: AppColors.primaryBlue,
                fontFamily: "Poppins",
                fontSize: 20,
                fontWeight: FontWeight.bold),
          )),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Top Business Headlines Shaping the Nation Today",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: AppColors.secondaryBlue,
                    ),
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  Text(
                    'Get real-time updates on key economic trends, market movements, and major corporate news. Stay informed and make smarter decisions with concise and relevant business news at your fingertips.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColors.secondaryBlue.withOpacity(0.9),
                        fontSize: 14),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: BasicAppButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            SignupPage()));
                              },
                              title: "Register")),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 1,
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          SigninPage()));
                            },
                            child: const Text(
                              "Sign in",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black),
                            )),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
