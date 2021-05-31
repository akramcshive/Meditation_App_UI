import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app_ui/constants/constants.dart';

class PlayButton extends StatefulWidget {
  @override
  _PlayButtonState createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> {
  AudioPlayer audioPlayer = new AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
  bool isPlaying = false;
  String currentMusic = "";
  IconData playPause = Icons.play_arrow;

  startPlayer(String URL) async {
    audioPlayer.play(URL);
    isPlaying = true;
  }

  stopPlayer() {
    // audioPlayer.play(url)
    audioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Positioned(
      bottom: size.height * 0.065,
      left: 0,
      right: 0,
      child: Container(
        width: size.width * 0.16,
        height: size.width * 0.16,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                black,
                indigo,
                blue,
                lightBlue,
              ],
            )),
        child: IconButton(
          onPressed: () {
            setState(() {
              isPlaying = true;
              startPlayer(
                  "https://songdownloadmp3free.com/wp-content/uploads/2020/04/Tum-Hi-Ho-Aashiqui-2-Hindi-Singer-Arijit-Singh.mp3");
              icon:
              Icon(
                playPause = Icons.pause,
              );
            });
            // if (isPlaying) {
            //   setState(() {
            //     audioPlayer.pause();
            //     icon:
            //     Icon(
            //       playPause = Icons.pause,
            //     );
            //     isPlaying = false;
            //   });
            // }else{
            //   audioPlayer.resume();
            //   setState(() {
            //     playPause = Icons.play_arrow;
            //   });
            // }
          },
          icon: Icon(
            playPause,
            color: white.withOpacity(0.9),
            size: 40,
          ),
        ),
      ),
    );
  }
}
