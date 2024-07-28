import 'package:dartz/dartz.dart';
import 'package:newsapiapp/data/sources/news/news_api_service.dart';
import 'package:newsapiapp/domain/repository/news/news.dart';
import 'package:newsapiapp/service_locator.dart';

class NewsRepositoryImpl extends NewsRepository {
  @override
  Future<Either> getNews() async {
    return await sl<NewsApiService>().getNews();
  }
}
