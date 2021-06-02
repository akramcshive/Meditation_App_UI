import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audioplayers_api.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app_ui/data/data.dart';
import 'package:meditation_app_ui/models/song.dart';
import 'package:meditation_app_ui/provider/music/music.dart';
import 'package:meditation_app_ui/screens/music/components/custom_body.dart';
import 'package:meditation_app_ui/screens/music/components/custom_bottom_nav_bar.dart';
import 'package:meditation_app_ui/screens/music/components/play_button.dart';
import 'package:provider/provider.dart';

class MusicScreen extends StatefulWidget {
  @override
  _MusicScreenState createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext _) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            //it contain image , background and songs,
            CustomBody(
              startPlayer: startPlayer,
            ),

            CustomBottomNavBar(),

            PlayButton(
              togglePlayer: () async {
                var musicState =
                    Provider.of<MusicState>(context, listen: false);
                if (musicState.isPlaying) {
                  await pausePlayer(musicState);
                } else {
                  await startPlayer(musicState);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
    audioPlayer.onPlayerStateChanged.listen((PlayerState playerState) {
      if (playerState == PlayerState.COMPLETED) {
        Provider.of<MusicState>(context).updatePlayingStatus(false);
      }
    });
  }

  @override
  void deactivate() {
    audioPlayer.stop();
    super.deactivate();
  }

  @override
  void dispose() {
    audioPlayer.stop();
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> playSong(MusicState musicState, String url) async {
    audioPlayer.stop();
    int result = await audioPlayer.play(url);
    if (result == 1) {
      musicState.updateCurrentSong(url);
      musicState.updatePlayingStatus(true);
    }
  }

  Future<void> startPlayer(MusicState musicState, {String url}) async {
    // if user has select any song
    if (url != null) {
      await playSong(musicState, url);
    }

    // not playing anything
    else if (musicState.currentSong == null) {
      Song song = songs[0];
      await playSong(musicState, song.url);
    } else {
      // start from previous position
      var result = await audioPlayer.resume();
      if (result == 1) {
        musicState.updatePlayingStatus(true);
      }
    }
  }

  Future pausePlayer(MusicState musicState) async {
    var result = await audioPlayer.pause();
    if (result == 1) {
      musicState.updatePlayingStatus(!musicState.isPlaying);
    }
  }
}
