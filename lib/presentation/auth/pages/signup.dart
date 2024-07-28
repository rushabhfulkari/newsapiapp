import 'package:flutter/material.dart';
import 'package:newsapiapp/common/widgets/appbar/app_bar.dart';
import 'package:newsapiapp/common/widgets/button/basic_app_button.dart';
import 'package:newsapiapp/core/configs/theme/app_colors.dart';
import 'package:newsapiapp/data/models/auth/create_user_request.dart';
import 'package:newsapiapp/domain/usecases/auth/signup.dart';
import 'package:newsapiapp/presentation/auth/pages/signin.dart';
import 'package:newsapiapp/presentation/home/pages/home.dart';
import 'package:newsapiapp/service_locator.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final _formKeySignupPage = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: _signUpButtonAndSiginText(context, height),
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
          key: _formKeySignupPage,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              _fullNameField(context),
              const SizedBox(
                height: 20,
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

  Widget _fullNameField(BuildContext context) {
    return TextFormField(
      controller: _fullName,
      cursorColor: AppColors.black,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value.toString().isEmpty) {
          return 'Enter Name';
        } else {
          return null;
        }
      },
      decoration: const InputDecoration(hintText: 'Name')
          .applyDefaults(Theme.of(context).inputDecorationTheme),
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

  Widget _signUpButtonAndSiginText(BuildContext context, double height) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
      child: SizedBox(
        height: height * 0.15,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            BasicAppButton(
                onPressed: () async {
                  if (_formKeySignupPage.currentState!.validate()) {
                    var result = await sl<SignUpUseCase>().call(
                        params: CreateUserReq(
                      fullName: _fullName.text.toString(),
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
                title: 'Signup'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account?',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => SigninPage()));
                    },
                    child: const Text(
                      'Login',
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
