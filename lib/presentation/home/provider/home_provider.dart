import 'package:flutter/material.dart';
import 'package:newsapiapp/domain/entities/news/news.dart';
import 'package:newsapiapp/domain/usecases/news/news.dart';
import 'package:newsapiapp/service_locator.dart';

class HomeProvider with ChangeNotifier {
  List<NewsEntity> newsList = [];

  bool loading = false;
  bool dataFetched = false;

  Future<void> getNews() async {
    loading = true;

    var returnedNews = await sl<GetNewsUseCase>().call();
    returnedNews.fold((l) {
      loading = false;
      dataFetched = false;
    }, (data) {
      loading = false;
      dataFetched = true;

      newsList = data;
    });

    notifyListeners();
  }
}
