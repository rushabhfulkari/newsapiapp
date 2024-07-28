import 'package:flutter/material.dart';
import 'package:newsapiapp/common/widgets/logoWidget/logo_widget.dart';
import 'package:newsapiapp/presentation/intro/pages/intro.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    redirect();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: LogoWidget()),
    );
  }

  Future<void> redirect() async {
    await Future.delayed(const Duration(seconds: 2));
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => const IntroPage()));
  }
}
