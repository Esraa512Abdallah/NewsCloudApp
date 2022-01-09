import 'package:cloudnewsapp/Models/app_local.dart';
import 'package:cloudnewsapp/ViewModels/lang_view_model.dart';
import 'package:cloudnewsapp/Views/bottom_navigation_bar/widget/customDrawer.dart';
import 'package:cloudnewsapp/views/bottom_navigation_bar/businessView.dart';
import 'package:cloudnewsapp/views/bottom_navigation_bar/entertainmentView.dart';
import 'package:cloudnewsapp/views/bottom_navigation_bar/healthView.dart';
import 'package:cloudnewsapp/views/bottom_navigation_bar/scienceView.dart';
import 'package:cloudnewsapp/views/bottom_navigation_bar/sportView.dart';
import 'package:cloudnewsapp/views/bottom_navigation_bar/widget/customIconeBottombar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:cloudnewsapp/helper/constans.dart';

class HomeView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StateHomeView();
  }

}
class StateHomeView extends State<HomeView>{



int index =0 ;
  List<Widget> Screens = [
    SportView(),
    HealthView(),
    ScienceView(),
    BusinessView(),
    EntertainmentView(),
  ];


@override
  Widget build(BuildContext context) {


  // TODO: implement build
    return Scaffold(

        drawer:CustomDrawer(),

      appBar: AppBar(

        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text.rich(
          TextSpan(
              children:
              [
                TextSpan(
                    text: AppLocal.of(context).getTranslated("NewsCloud"),
                    style: TextStyle(
                        color: Colors.orange ,
                        fontSize: 20 , fontWeight: FontWeight.bold,
                    ),
                ),
                TextSpan(
                    text: AppLocal.of(context).getTranslated("App"),
                    style: TextStyle(color: Colors.white , fontSize: 20 , fontWeight: FontWeight.bold)

                )
              ]
          ),

        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.black,
        backgroundColor: Colors.white,

        index: index,
        onTap: (val){
          setState(() {
            index = val ;
          });
        },
        items:  [
          CustomIcone(icon:Icons.sports_baseball),
          CustomIcone(icon:Icons.health_and_safety),
          CustomIcone(icon:Icons.science_outlined),
          CustomIcone(icon:Icons.business_center),
          CustomIcone(icon:Icons.headset),

        ],


      ),
      body: Screens[index],
    );
  }




}