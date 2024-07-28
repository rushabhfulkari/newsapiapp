import 'package:dartz/dartz.dart';

abstract class NewsRepository {
  Future<Either> getNews();
}
