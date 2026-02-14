import 'dart:html' as html; // Only needed for Web detection
import 'package:flutter/foundation.dart'; // for kIsWeb
import 'package:just_audio/just_audio.dart';

class AudioPlayerService {
  static final AudioPlayerService _instance = AudioPlayerService._internal();
  late final AudioPlayer _player;
  bool _isInitialized = false;

  factory AudioPlayerService() => _instance;

  AudioPlayerService._internal() {
    _player = AudioPlayer();
  }

  Future<void> init() async {
    if (_isInitialized) return;

    if (kIsWeb) {
      // Use URI for web assets
      await _player.setAudioSource(
        AudioSource.uri(
          Uri.parse('assets/audio/wedding_music.mp3'),
        ),
      );
    } else {
      // Mobile: use asset normally
      await _player.setAudioSource(
        AudioSource.asset('assets/audio/wedding_music.mp3'),
      );
    }

    await _player.playerStateStream.firstWhere((state) =>
        state.processingState == ProcessingState.ready ||
        state.processingState == ProcessingState.completed);

    await _player.setLoopMode(LoopMode.one);
    _isInitialized = true;
  }

  Future<void> play() async {
    if (!_isInitialized) await init();
    await _player.play();
  }

  Future<void> pause() async => _player.pause();
  bool get isPlaying => _player.playing;
}
