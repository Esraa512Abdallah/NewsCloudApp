
import 'package:cloudnewsapp/ViewModels/news_view_model.dart';
import 'package:get/get.dart';

class Binding implements Bindings{
  @override
  void dependencies() {
    NewsViewModel NewsController = Get.put(NewsViewModel());
  }

}