import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:newsapiapp/common/services/firebaseRemoteConfig/firebase_Remote_config_service.dart';
import 'package:newsapiapp/core/configs/constants/app_urls.dart';
import 'package:newsapiapp/data/models/news/news.dart';
import 'package:newsapiapp/domain/entities/news/news.dart';

abstract class NewsApiService {
  Future<Either> getNews();
}

class NewsApiServiceImpl extends NewsApiService {
  @override
  Future<Either> getNews() async {
    try {
      List<NewsEntity> newsList = [];

      final remoteConfig = FirebaseRemoteConfigService();

      String countryCode = remoteConfig.getString("countryCode");

      log(countryCode.toString());

      var response = await Dio().get(
          '${AppURLs.newsAPIBaseUrl}?country=$countryCode&apiKey=${AppURLs.apiKey}');

      for (var i = 0; i < (response.data['articles'].length); i++) {
        var newsModel = NewsModel.fromJson(response.data['articles'][i]);
        newsList.add(newsModel.toEntity());
      }

      return Right(newsList);
    } catch (e) {
      log("messageError $e");
      return const Left('An error occurred, Please try again');
    }
  }
}
