import 'package:dartz/dartz.dart';
import 'package:newsapiapp/core/usecase/usecase.dart';
import 'package:newsapiapp/data/models/auth/signin_user_request.dart';
import 'package:newsapiapp/domain/repository/auth/auth.dart';
import 'package:newsapiapp/service_locator.dart';

class SignInUseCase implements UseCase<Either, SigninUserReq> {
  @override
  Future<Either> call({SigninUserReq? params}) async {
    return await sl<AuthRepository>().signin(params!);
  }
}
