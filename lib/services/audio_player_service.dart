import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerService {
  static final AudioPlayerService _instance =
      AudioPlayerService._internal();

  late final AudioPlayer _player;
  bool _isInitialized = false;

  factory AudioPlayerService() => _instance;

  AudioPlayerService._internal() {
    _player = AudioPlayer();
  }

  Future<void> init() async {
    if (_isInitialized) return;

    if (kIsWeb) {
      await _player.setUrl(
        'assets/assets/audio/wedding_music.mp3',
      );
    } else {
      await _player.setAsset('assets/audio/wedding_music.mp3');
    }

    await _player.setLoopMode(LoopMode.one);
    await _player.setVolume(1.0);

    _isInitialized = true;
  }

  Future<void> play() async {
    if (!_isInitialized) await init();
    await _player.play();
  }

  Future<void> pause() async => _player.pause();

  Stream<bool> get playingStream => _player.playingStream;
}
