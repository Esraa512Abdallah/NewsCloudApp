import 'package:cached_network_image/cached_network_image.dart';

import 'package:cloudnewsapp/helper/constans.dart';
import 'package:cloudnewsapp/helper/sized_config.dart';
import 'package:cloudnewsapp/view_model/news_view_model.dart';
import 'package:cloudnewsapp/view/bottom_navigation_bar/widget/custom_text.dart';
import 'package:cloudnewsapp/model/app_local.dart';
import 'package:cloudnewsapp/model/news_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:get/get.dart';



class HealthView extends GetWidget<NewsViewModel> {

  NewsViewModel NewsController = Get.put(NewsViewModel());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    // TODO: implement build
    return Container(
      child: FutureBuilder(
        future: NewsController.FetchApiData('health'),
        builder: (context, AsyncSnapshot? snapshot) {
          NewsModel? data = snapshot!.data;

          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: data!.Articles!.length,
              itemBuilder: (context, int? index) {
                return Container(
                  width: double.infinity,
                  color: BlackColor,
                  child: Column(
                    children: [
                      Card(
                        color: GreyColor2,
                        margin: EdgeInsets.only(
                          left: SizeConfig.defaultSize! * 1.3,
                          right: SizeConfig.defaultSize! * 1.3,
                          top: SizeConfig.defaultSize! * 1.3,
                        ),
                        child: Container(
                          padding:
                              EdgeInsets.all(SizeConfig.defaultSize! * 1.3),
                          child: Column(
                            children: [
                              CachedNetworkImage(
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(
                                        color: GreyColor1),
                                imageUrl:
                                    data.Articles![index!].imageurl.toString(),
                                fit: BoxFit.fill,
                              ),
                              SizedBox(
                                height: SizeConfig.defaultSize! * 1.2,
                              ),
                              CustomText(
                                data.Articles![index].title.toString(),
                                textDirection: (country == 'eg')
                                    ? TextDirection.rtl
                                    : TextDirection.ltr,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: BlackColor,
                                fontFamily: "RobotoCondensed",
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: SizeConfig.defaultSize! * 1.3,
                                    top: SizeConfig.defaultSize! * 0.7),
                                child: CustomText(
                                  data.Articles![index].description.toString(),
                                  textDirection: (country == 'eg')
                                      ? TextDirection.rtl
                                      : TextDirection.ltr,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: GreyColor1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: GreyColor1,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    AppLocal.of(context)
                        .getTranslated("check Internet connection !!"),
                    color: GreyColor1,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
