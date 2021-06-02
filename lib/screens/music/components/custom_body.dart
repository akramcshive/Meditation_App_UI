import 'package:flutter/material.dart';
import 'package:meditation_app_ui/constants/constants.dart';
import 'package:meditation_app_ui/data/data.dart';
import 'package:meditation_app_ui/provider/music/music.dart';
import 'package:meditation_app_ui/screens/music/components/custom_header.dart';
import 'package:provider/provider.dart';

class CustomBody extends StatelessWidget {
  const CustomBody({Key key, @required this.startPlayer})
      : assert(startPlayer != null),
        super(key: key);

  final void Function(MusicState state, {String url}) startPlayer;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double listHeight = ((size.height * 0.06) * songs.length).toDouble();

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
                          var musicState =
                              Provider.of<MusicState>(context, listen: false);
                          String urlPlay = songs[index].url;
                          print("this is url played $urlPlay");
                          startPlayer(musicState, url: urlPlay);
                          String meditateName = songs[index].name;
                          print("this is name played $meditateName");
                          print("${musicState.isPlaying}");
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
