import 'package:flutter/material.dart';

class FlutterFlowTheme {
  static Future<void> initialize() async {}

  static FlutterFlowTheme of(BuildContext context) {
    return FlutterFlowTheme();
  }

  // I colori principali di Vybe che hai usato nei GradientText e nei bottoni
  Color get primary => const Color(0xFF1DB954); // Il verde Spotify
  Color get secondary => const Color(0xFF121212); // Il nero di sfondo
  Color get info => Colors.white;

  // Stili di testo richiesti dalle tue pagine (Home e Player)
  TextStyle get headlineMedium => const TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      );

  TextStyle get titleMedium => const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      );

  TextStyle get titleSmall => const TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      );

  TextStyle get bodyMedium => const TextStyle(
        color: Color(0xFFB3B3B3),
        fontSize: 14,
      );

  TextStyle get bodySmall => const TextStyle(
        color: Color(0xFF888888),
        fontSize: 12,
      );

  TextStyle get labelMedium => const TextStyle(
        color: Color(0xFFB3B3B3),
        fontSize: 11,
        fontWeight: FontWeight.w600,
      );
}

// Estensione per permettere il metodo .override che FlutterFlow usa ovunque sui testi
extension TextStyleHelper on TextStyle {
  TextStyle override({
    required TextStyle font,
    Color? color,
    double? fontSize,
    double? letterSpacing,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
  }) {
    return copyWith(
      color: color ?? this.color,
      fontSize: fontSize ?? this.fontSize,
      letterSpacing: letterSpacing ?? this.letterSpacing,
      fontWeight: fontWeight ?? this.fontWeight,
      fontStyle: fontStyle ?? this.fontStyle,
    );
  }
}
