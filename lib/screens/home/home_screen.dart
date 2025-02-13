import 'package:flutter/material.dart';
import 'package:meditation_app_ui/screens/home/components/custom_body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [

            //contains images and curved clippers
            CustomBody(),

            //custom curved appbar
            // CustomAppBar(),

            //round profile picture
            // ProfilePicture(),

            // CustomBottomNavigationBar(),

            //contains bottom navigation Icons and text
            // BottomNavigationIcons(),


            // we completed the first screen and lest moves to second screen Lets calls
            //second sreen when tapping Meditation Text
          ],
        ),
      ),
    );
  }
}
