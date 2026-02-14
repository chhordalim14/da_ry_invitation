import 'package:da_ry_invitation/services/audio_player_service.dart';
import 'package:flutter/material.dart';

class AudioPlayerButton extends StatefulWidget {
  const AudioPlayerButton({super.key});

  @override
  State<AudioPlayerButton> createState() => _AudioPlayerButtonState();
}

class _AudioPlayerButtonState extends State<AudioPlayerButton> {
  final audioService = AudioPlayerService();
  bool _isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        if (_isPlaying) {
          await audioService.pause();
        } else {
          await audioService.play(); // ✅ Web-safe
        }
        setState(() => _isPlaying = !_isPlaying);
      },
      child: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
    );
  }
}
