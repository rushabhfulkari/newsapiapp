import 'package:dartz/dartz.dart';
import 'package:newsapiapp/core/usecase/usecase.dart';
import 'package:newsapiapp/data/models/auth/create_user_request.dart';
import 'package:newsapiapp/domain/repository/auth/auth.dart';
import 'package:newsapiapp/service_locator.dart';

class SignUpUseCase implements UseCase<Either, CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq? params}) async {
    return await sl<AuthRepository>().signup(params!);
  }
}
