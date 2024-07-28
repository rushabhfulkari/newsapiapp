import 'package:dartz/dartz.dart';
import 'package:newsapiapp/core/usecase/usecase.dart';
import 'package:newsapiapp/domain/repository/news/news.dart';
import 'package:newsapiapp/service_locator.dart';

class GetNewsUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<NewsRepository>().getNews();
  }
}
