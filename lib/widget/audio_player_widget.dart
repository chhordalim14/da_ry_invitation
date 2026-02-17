import 'package:da_ry_invitation/services/audio_player_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AudioPlayerButton extends StatefulWidget {
  const AudioPlayerButton({super.key});

  @override
  State<AudioPlayerButton> createState() => _AudioPlayerButtonState();
}

class _AudioPlayerButtonState extends State<AudioPlayerButton> {
  final audioService = AudioPlayerService();

  // @override
  // void initState() {
  //   super.initState();
  //   audioService.init();
  // }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: audioService.playingStream,
      builder: (context, snapshot) {
        final isPlaying = snapshot.data ?? false;
        return Container(
          height: MediaQuery.sizeOf(context).height * 0.04,
          width: MediaQuery.sizeOf(context).height * 0.04,

          alignment: Alignment.center,
          child: FloatingActionButton(
            backgroundColor: Colors.amber.shade700,
            onPressed: () async {
              if (isPlaying) {
                await audioService.pause();
              } else {
                await audioService.play();
              }
            },
            child: Icon(
              size: 16,
              color: Colors.white,
              isPlaying ? FontAwesomeIcons.pause : FontAwesomeIcons.play,
            ),
          ),
        );
      },
    );
  }
}
