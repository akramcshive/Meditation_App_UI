import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app_ui/constants/constants.dart';
import 'package:meditation_app_ui/data/data.dart';
import 'package:meditation_app_ui/screens/music/components/custom_header.dart';

class CustomBody extends StatefulWidget {
  @override
  _CustomBodyState createState() => _CustomBodyState();
}

class _CustomBodyState extends State<CustomBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isPlaying = false;
    String currentSong = "";
    AudioPlayer audioPlayer = new AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);

    double listHeight = ((size.height * 0.06) * songs.length).toDouble();


    startPlayer(String url) async {
      if (isPlaying && currentSong != url) {
        audioPlayer.pause();
        int result = await audioPlayer.play(url);
        if (result == 1) {
          setState(() {
            currentSong = url;
          });
        }
      } else if (!isPlaying) {
        int result = await audioPlayer.play(url);
        if (result == 1) {
          setState(() {
            isPlaying = true;
          });
        }
      }
    }

    
    return Material(
      child: Column(
        children: [
          // contains image and background image with clipper
          CustomHeader(),

          // List of songs
          Expanded(
              child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: listHeight,
              padding: EdgeInsets.symmetric(horizontal: appPadding * 1.5),
              margin: EdgeInsets.only(bottom: size.height * 0.1),
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: songs.length,
                  itemExtent: size.height * 0.055,
                  itemBuilder: (context, index) => ListTile(
                        onTap: () {
                          String urlPlay = songs[index].url;
                          debugPrint("this is url played $urlPlay");
                          startPlayer(urlPlay);
                          String meditateName = songs[index].name;
                          debugPrint("this is name played $meditateName");
                          // pausePlayer();
                          print("$isPlaying");
                          if(isPlaying){
                            audioPlayer.pause();
                            setState(() {
                              isPlaying = false;
                            });
                          }else{
                            audioPlayer.resume();
                          }
                        },
                        leading: Icon(
                          index == 0
                              ? Icons.play_arrow
                              : Icons.play_circle_fill_outlined,
                          size: 22,
                        ),
                        title: index == 0
                            ? Text(
                                songs[index].name,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: black,
                                ),
                              )
                            : Text(
                                songs[index].name,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: black,
                                ),
                              ),
                        trailing: index == 0
                            ? Text(
                                songs[index].time,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: black,
                                ),
                              )
                            : Text(
                                songs[index].time,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: black,
                                ),
                              ),
                      )),
            ),
          ))
        ],
      ),
    );
  }
}
