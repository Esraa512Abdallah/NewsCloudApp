import 'package:cloudnewsapp/Models/app_local.dart';
import 'package:cloudnewsapp/Models/news_model.dart';
import 'package:cloudnewsapp/ViewModels/lang_view_model.dart';
import 'package:cloudnewsapp/ViewModels/news_view_model.dart';
import 'package:cloudnewsapp/helper/sizedConfig.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../../helper/constans.dart';
import 'customText.dart';

class CustomDrawer extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StateCustomDrawer();
  }

}
class StateCustomDrawer extends State<CustomDrawer>{

  NewsViewModel NewsController = Get.put(NewsViewModel());

  bool _isButtonPressed1 = false;
  bool _isButtonPressed2 = false;
  bool _isButtonPressed3 = false;
  bool _isButtonPressed4 = false;
  bool _isButtonPressed5 = false;
  bool _isButtonPressed6 = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // TODO: implement build
    return Drawer(



      child:Container(
        color: Colors.black,
        child: ListView(

          children: [
            Container(
              // color: Colors.black,
              child:DrawerHeader(
                  decoration: BoxDecoration(color: Colors.black,),
                  child: (country == 'eg') ?Image.asset("assets/images/Egypt2.png",width:double.infinity,height: double.infinity,)
                      :(country == 'us') ?Image.asset("assets/images/Us2.jpg",width:double.infinity,height: double.infinity):
                  Image.asset("assets/images/France2.gif",width:double.infinity,height: double.infinity,)
              ),),

            Divider(
              height: SizeConfig.defaultSize!*2.5 ,
              color: Colors.grey,
            ),
            Container(

              color:Colors.black,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      left: SizeConfig.defaultSize!*2.5 ,
                      right: SizeConfig.defaultSize!*2.5,
                      top: SizeConfig.defaultSize!*2 ,
                    ),

                    child: Text(
                      AppLocal.of(context).getTranslated("Countries news"),

                      style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  Container(

                      padding: EdgeInsets.only(
                          top: SizeConfig.defaultSize!*1.7,
                          bottom: SizeConfig.defaultSize!*1.7,
                          right: SizeConfig.defaultSize!*2.5,
                          left: SizeConfig.defaultSize!*2.5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [

                          FlatButton(
                            height:SizeConfig.defaultSize!*4.5 ,

                            color: _isButtonPressed1 ? Colors.grey : Colors.black54 ,
                            shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.grey,width: 1.5),

                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/Egypt.png",
                                  height: 30,
                                  width: 50,
                                ),
                                SizedBox(width: SizeConfig.defaultSize!*1.7,),
                                Text(
                                  AppLocal.of(context).getTranslated("Egypt"),
                                  style: TextStyle(color: Colors.white ,
                                    fontSize: 16 ,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            onPressed: (){
                              setState(() {
                                country = 'eg' ;
                                _isButtonPressed1=!_isButtonPressed1;
                                _isButtonPressed2 = false;
                                _isButtonPressed3 = false;
                              });

                            },
                          ),



                          ////////////////////////////////////////////////////////////
                          SizedBox(height: 15,),

                          FlatButton(
                            height:SizeConfig.defaultSize!*4.5 ,
                            color: _isButtonPressed2 ?  Colors.grey:Colors.black54 ,
                            shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.grey,width: 1.5),


                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/us.png",
                                  height: 30,
                                  width: 50,
                                ),
                                SizedBox(width: 10,),
                                Text(AppLocal.of(context).getTranslated("USA"),
                                  style: TextStyle(
                                    color: Colors.white ,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            onPressed: (){
                              setState(() {
                                _isButtonPressed2 = !_isButtonPressed2;
                                _isButtonPressed1 = false;
                                _isButtonPressed3 = false;
                                country = 'us' ;});

                            },
                          ),
                          SizedBox(height: 15,),

                          FlatButton(
                            height:SizeConfig.defaultSize!*4.5 ,
                            color: _isButtonPressed3 ?Colors.grey: Colors.black54 ,
                            shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.grey,width: 1.5),


                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/France.png",
                                  height: 30,
                                  width: 50,
                                ),
                                SizedBox(width: 10,),
                                Text(
                                  AppLocal.of(context).getTranslated("French Republic"),
                                  style: TextStyle(
                                    color: Colors.white ,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  overflow: TextOverflow.ellipsis,),
                              ],
                            ),
                            onPressed: (){
                              setState(() {
                                country = 'fr' ;
                                _isButtonPressed3 = ! _isButtonPressed3;
                                _isButtonPressed2 = false;
                                _isButtonPressed1 = false;
                              });

                            },

                          ),
                        ],
                      )


                  ),

                  Divider(
                    height: SizeConfig.defaultSize!*3 ,
                    color: Colors.grey,
                  ),

                  Container(
                    padding: EdgeInsets.only(
                      left: SizeConfig.defaultSize!*2.5 ,
                      right: SizeConfig.defaultSize!*2.5,
                      top: SizeConfig.defaultSize!*1.7 ,
                    ),
                    child:Text(
                      AppLocal.of(context).getTranslated("Change language"),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  Container(

                      padding: EdgeInsets.only(
                          top: SizeConfig.defaultSize!*1.7,
                          bottom: SizeConfig.defaultSize!*1.7,
                          right: SizeConfig.defaultSize!*2.5,
                          left: SizeConfig.defaultSize!*2.5),
                      child: Column(
                        children: [

                          GetBuilder<LangViewModel>(
                              init:LangViewModel() ,
                              builder:( controller ) {
                                return FlatButton(
                                  height:SizeConfig.defaultSize!*4.5 ,
                                  color: _isButtonPressed4 ? Colors.grey : Colors.black54,
                                  shape:RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.grey,width: 1.5),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(AppLocal.of(context).getTranslated("Arabic"),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isButtonPressed4 =!_isButtonPressed4;
                                      _isButtonPressed5=false;
                                      _isButtonPressed6=false;
                                    });
                                    controller.changLang("ar");
                                    Get.updateLocale(Locale('ar', ''));
                                  },

                                );
                              }

                          ),
                          SizedBox(height: 15,),
                          GetBuilder<LangViewModel>(
                              init:LangViewModel() ,
                              builder:( controller ) {
                                return FlatButton(
                                  height:SizeConfig.defaultSize!*4.5 ,
                                  color: _isButtonPressed5 ? Colors.grey : Colors.black54,
                                  shape:RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.grey,width: 1.5),

                                  ),
                                  child: Row(
                                    children: [
                                      Text(AppLocal.of(context).getTranslated("English"),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16 ,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        overflow: TextOverflow.ellipsis,),
                                    ],
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isButtonPressed5 =!_isButtonPressed5;
                                      _isButtonPressed4=false;
                                      _isButtonPressed6=false;


                                    });
                                    controller.changLang("en");
                                    Get.updateLocale(Locale('en', ''));
                                  },
                                );
                              }

                          ),

                          SizedBox(height: 15,),
                          GetBuilder<LangViewModel>(
                              init:LangViewModel() ,
                              builder:( controller ) {
                                return FlatButton(
                                  height:SizeConfig.defaultSize!*4.5 ,
                                  color: _isButtonPressed6 ? Colors.grey : Colors.black54,
                                  shape:RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.grey,width: 1.5),

                                  ),
                                  child: Row(
                                    children: [
                                      Text(AppLocal.of(context).getTranslated("French"),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16 ,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        overflow: TextOverflow.ellipsis,),
                                    ],
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isButtonPressed6 =!_isButtonPressed6;
                                      _isButtonPressed4=false;
                                      _isButtonPressed5=false;


                                    });
                                    controller.changLang("fr");
                                    Get.updateLocale(Locale('fr', ''));
                                  },
                                );
                              }

                          ),
                        ],
                      )


                  ),
                 /* Container(
                    height: SizeConfig.defaultSize!*5,
                    color: Colors.black,
                  ),*/

                ],
              ),



            ),

          ],
        ),
      ),

    );
  }

}
