import 'package:dartz/dartz.dart';
import 'package:newsapiapp/data/models/auth/create_user_request.dart';
import 'package:newsapiapp/data/models/auth/signin_user_request.dart';
import 'package:newsapiapp/data/sources/auth/auth_firebase_service.dart';
import 'package:newsapiapp/domain/repository/auth/auth.dart';
import 'package:newsapiapp/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    return await sl<AuthFirebaseService>().signin(signinUserReq);
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    return await sl<AuthFirebaseService>().signup(createUserReq);
  }
}
