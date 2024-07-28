import 'package:flutter/material.dart';
import 'package:newsapiapp/common/widgets/appbar/app_bar.dart';
import 'package:newsapiapp/common/widgets/button/basic_app_button.dart';
import 'package:newsapiapp/core/configs/theme/app_colors.dart';
import 'package:newsapiapp/data/models/auth/signin_user_request.dart';
import 'package:newsapiapp/domain/usecases/auth/signin.dart';
import 'package:newsapiapp/presentation/auth/pages/signup.dart';
import 'package:newsapiapp/presentation/home/pages/home.dart';
import 'package:newsapiapp/service_locator.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final _formKeySigninPage = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: _signInButtonAndSignupText(context, height),
      appBar: const BasicAppbar(
          title: Text(
        "MyNews",
        style: TextStyle(
            color: AppColors.primaryBlue,
            fontFamily: "Poppins",
            fontSize: 20,
            fontWeight: FontWeight.bold),
      )),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
        child: Form(
          key: _formKeySigninPage,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              _emailField(context),
              const SizedBox(
                height: 20,
              ),
              _passwordField(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextFormField(
      controller: _email,
      cursorColor: AppColors.black,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value.toString().isEmpty) {
          return 'Enter Email';
        } else if (!value.toString().contains("@")) {
          return 'Enter Valid Email';
        } else {
          return null;
        }
      },
      decoration: const InputDecoration(hintText: 'Email')
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextFormField(
      controller: _password,
      cursorColor: AppColors.black,
      keyboardType: TextInputType.text,
      onEditingComplete: () {
        FocusScope.of(context).unfocus();
      },
      validator: (value) {
        if (value.toString().isEmpty) {
          return 'Enter Password';
        } else {
          return null;
        }
      },
      decoration: const InputDecoration(hintText: 'Password')
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _signInButtonAndSignupText(BuildContext context, double height) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
      child: SizedBox(
        height: height * 0.15,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            BasicAppButton(
                onPressed: () async {
                  if (_formKeySigninPage.currentState!.validate()) {
                    var result = await sl<SignInUseCase>().call(
                        params: SigninUserReq(
                      email: _email.text.toString(),
                      password: _password.text.toString(),
                    ));

                    result.fold(
                      (l) {
                        var snackbar = SnackBar(
                          content: Text(
                            l,
                            style: const TextStyle(color: AppColors.white),
                          ),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: AppColors.secondaryBlue,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          snackbar,
                        );
                      },
                      (r) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const HomePage()),
                            (route) => false);
                      },
                    );
                  }
                },
                title: 'Sign In'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'New here?',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => SignupPage()));
                    },
                    child: const Text(
                      'Signup',
                      style: TextStyle(
                          color: AppColors.primaryBlue,
                          fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
