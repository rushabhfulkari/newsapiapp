import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newsapiapp/common/services/firebaseRemoteConfig/firebase_Remote_config_service.dart';
import 'package:newsapiapp/core/configs/theme/app_theme.dart';
import 'package:newsapiapp/firebase_options.dart';
import 'package:newsapiapp/presentation/home/provider/home_provider.dart';
import 'package:newsapiapp/presentation/splash/pages/splash.dart';
import 'package:newsapiapp/service_locator.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await FirebaseRemoteConfigService().initialize();

  await initializeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider())
      ],
      child: MaterialApp(
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        home: const SplashPage(),
      ),
    );
  }
}
