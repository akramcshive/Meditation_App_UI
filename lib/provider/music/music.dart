import 'package:flutter/material.dart';

class MusicState with ChangeNotifier {
  bool _isPlaying = false;
  String _currentSong;
  bool get isPlaying => _isPlaying;

  String get currentSong => _currentSong;

  void updatePlayingStatus(bool isPlaying) {
    _isPlaying = isPlaying;
    notifyListeners();
  }

  void updateCurrentSong(String currentSong) {
    _currentSong = currentSong;
    notifyListeners();
  }
}
