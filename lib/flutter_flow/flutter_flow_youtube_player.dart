import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FlutterFlowYoutubePlayer extends StatefulWidget {
  const FlutterFlowYoutubePlayer({
    super.key,
    required this.url,
    this.autoPlay = false,
    this.loop = false,
    this.mute = false,
    this.showControls = true,
    this.width,
    this.height,
  });

  final String url;
  final bool autoPlay;
  final bool loop;
  final bool mute;
  final bool showControls;
  final double? width;
  final double? height;

  @override
  State<FlutterFlowYoutubePlayer> createState() => _FlutterFlowYoutubePlayerState();
}

class _FlutterFlowYoutubePlayerState extends State<FlutterFlowYoutubePlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    final videoId = YoutubePlayer.convertUrlToId(widget.url) ?? widget.url;
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: widget.autoPlay,
        mute: widget.mute,
        loop: widget.loop,
        controlsVisibleAtStart: widget.showControls,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: widget.showControls,
        progressIndicatorColor: const Color(0xFF1DB954), // Verde Vybe
      ),
    );
  }
}
