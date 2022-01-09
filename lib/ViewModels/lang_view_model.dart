import 'package:get/get.dart';
import 'package:translator/translator.dart';

// store and change current language
class LangViewModel extends GetxController {

  String lang = 'en';
 // final translat = GoogleTranslator();
  //Future<dynamic>?  trans;
  //String?  trans;



  /*Translator( String input,String fromlang ,String tolang  )async{

   //trans = (  await translat.translate( input, from: fromlang, to: tolang)) as Future<dynamic>?;
    translat.translate( input, from: fromlang, to: tolang);


    update();
  }*/
  changLang(String lan) {
    lang = lan;
    update();
  }
}
