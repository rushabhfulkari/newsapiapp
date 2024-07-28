import 'package:get_it/get_it.dart';
import 'package:newsapiapp/data/repository/auth/auth_repository_impl.dart';
import 'package:newsapiapp/data/repository/news/news_repository_impl.dart';
import 'package:newsapiapp/data/sources/auth/auth_firebase_service.dart';
import 'package:newsapiapp/data/sources/news/news_api_service.dart';
import 'package:newsapiapp/domain/repository/auth/auth.dart';
import 'package:newsapiapp/domain/repository/news/news.dart';
import 'package:newsapiapp/domain/usecases/auth/signin.dart';
import 'package:newsapiapp/domain/usecases/auth/signup.dart';
import 'package:newsapiapp/domain/usecases/news/news.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  sl.registerSingleton<NewsApiService>(NewsApiServiceImpl());

  sl.registerSingleton<NewsRepository>(NewsRepositoryImpl());

  sl.registerSingleton<GetNewsUseCase>(GetNewsUseCase());

  sl.registerSingleton<SignUpUseCase>(SignUpUseCase());

  sl.registerSingleton<SignInUseCase>(SignInUseCase());
}
