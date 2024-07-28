import 'package:dartz/dartz.dart';
import 'package:newsapiapp/data/models/auth/create_user_request.dart';
import 'package:newsapiapp/data/models/auth/signin_user_request.dart';

abstract class AuthRepository {
  Future<Either> signup(CreateUserReq createUserReq);
  Future<Either> signin(SigninUserReq signinUserReq);
}
