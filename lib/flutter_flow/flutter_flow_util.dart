import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Classe base per tutti i model dell'app (es. HomePageModel, PlayerModel)
abstract class FlutterFlowModel<W extends StatefulWidget> {
  void initState(BuildContext context);
  void dispose();
}

// Funzione helper per creare i model nei widget
T createModel<T extends FlutterFlowModel>(
  BuildContext context,
  T Function() defaultBuilder,
) {
  final model = defaultBuilder();
  model.initState(context);
  return model;
}

// Estensione per usare safeSetState nei widget ed evitare crash se la pagina si chiude
extension StatefulStateExtensions<T extends StatefulWidget> on State<T> {
  void safeSetState(VoidCallback fn) {
    if (mounted) {
      setState(fn);
    }
  }
}

// Estensione .divide per distanziare gli elementi nelle Row e nelle Column
extension WidgetListDivideExtension on List<Widget> {
  List<Widget> divide(Widget separator) {
    if (isEmpty) return this;
    final newWidgets = <Widget>[];
    for (var i = 0; i < length - 1; i++) {
      newWidgets.add(this[i]);
      newWidgets.add(separator);
    }
    newWidgets.add(last);
    return newWidgets;
  }

  List<Widget> around(Widget separator) => [separator, ...this, separator];
}

// Gestione dei file caricati (usata nel player per simulare i file locali)
class FFUploadedFile {
  const FFUploadedFile({
    this.name,
    this.bytes,
    this.height,
    this.width,
    this.blurHash,
    this.originalFilename,
  });
  final String? name;
  final BigInt? bytes; // Gestito come BigInt o dynamic per compatibilità con FF
  final double? height;
  final double? width;
  final String? blurHash;
  final String? originalFilename;
}

// Funzione finta per evitare errori sul selectFiles (da implementare con file_picker in futuro)
Future<List<FFUploadedFile>?> selectFiles({
  List<String>? allowedExtensions,
  bool multiFile = false,
}) async {
  return null;
}

// Funzione per lanciare i link (usata nel player per aprire ytmp3)
Future<bool> launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    return await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
  return false;
}

// Gestione dei valori di default se una stringa è nulla
String valueOrDefault<T>(T? value, String defaultValue) {
  if (value == null) return defaultValue;
  if (value is String && value.isEmpty) return defaultValue;
  return value.toString();
}

// Estensione per pulire le mappe dai valori nulli
extension MapWithoutNulls<K, V> on Map<K, V> {
  Map<K, V> get withoutNulls => Map.fromEntries(
        entries.where((e) => e.value != null),
      );
}

// Finta classe base per le strutture dati
abstract class BaseStruct {
  const BaseStruct();
  Map<String, dynamic> toMap();
  Map<String, dynamic> toSerializableMap();
}

// Stato globale dell'app (Libreria, Download, ecc.)
class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  bool _isDownloading = false;
  bool get isDownloading => _isDownloading;
  set isDownloading(bool val) {
    _isDownloading = val;
    notifyListeners();
  }

  List<dynamic> _libreriaDownload = [];
  List<dynamic> get libreriaDownload => _libreriaDownload;
  
  void addToLibreriaDownload(dynamic val) {
    _libreriaDownload.add(val);
    notifyListeners();
  }
}
