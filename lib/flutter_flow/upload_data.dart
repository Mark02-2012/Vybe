import 'package:flutter/material.dart';
import 'flutter_flow_util.dart';

// Classe wrapper per gestire lo stato del caricamento nel PlayerModel
class YoutubeFullScreenWrapper extends StatelessWidget {
  const YoutubeFullScreenWrapper({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

// Funzione finta che permette al bottone di download di compilare senza errori
class SelectedFile {
  const SelectedFile({
    required this.storagePath,
    required this.bytes,
    this.originalFilename,
  });
  final String storagePath;
  final dynamic bytes;
  final String? originalFilename;
}
