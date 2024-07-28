import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:newsapiapp/core/configs/constants/app_urls.dart';
import 'package:newsapiapp/core/configs/theme/app_colors.dart';
import 'package:newsapiapp/domain/entities/news/news.dart';
import 'package:newsapiapp/presentation/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

import '../../../common/widgets/appbar/app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Provider.of<HomeProvider>(context, listen: false).getNews();
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: const BasicAppbar(
            hideBack: true,
            title: Text(
              "MyNews",
              style: TextStyle(
                  color: AppColors.primaryBlue,
                  fontFamily: "Poppins",
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
        body: homeProvider.loading
            ? const Center(
                child: SizedBox(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(
                      backgroundColor: AppColors.primaryBlue,
                    )),
              )
            : homeProvider.dataFetched
                ? SingleChildScrollView(
                    child: SizedBox(
                      height: height,
                      width: width,
                      child: ListView.builder(
                          itemCount: homeProvider.newsList.length,
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 100),
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return _listItemNews(
                              height,
                              width,
                              homeProvider.newsList[index],
                            );
                          }),
                    ),
                  )
                : Center(
                    child: SizedBox(
                        height: 100,
                        width: width,
                        child: const Text("Something Went Wrong")),
                  ));
  }

  _listItemNews(height, width, NewsEntity newsObject) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10.0,
      ),
      child: SizedBox(
        width: width,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Container(
            decoration: const BoxDecoration(color: AppColors.white),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          newsObject.sourceName,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppColors.black),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(newsObject.title),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          Jiffy.parse(newsObject.publishedAt)
                              .fromNow()
                              .toString(),
                          style: const TextStyle(
                            color: AppColors.primaryGrey,
                            fontStyle: FontStyle.italic,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: Image.network(
                          newsObject.urlToImage == ""
                              ? AppURLs.placeholderImageUrl
                              : newsObject.urlToImage,
                          height: height * 0.12,
                          fit: BoxFit.cover,
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
