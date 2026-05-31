import '/flutter_flow/flutter_flow_util.dart';

class CanzoneLocaleStruct extends BaseStruct {
  CanzoneLocaleStruct({
    String? titolo,
    String? autore,
    String? percorsofile,
    String? copertina,
  }) : _titolo = titolo,
       _autore = autore,
       _percorsofile = percorsofile,
       _copertina = copertina;

  String? _titolo;
  String get titolo => _titolo ?? '';
  set titolo(String? val) => _titolo = val;

  String? _autore;
  String get autore => _autore ?? '';
  set autore(String? val) => _autore = val;

  String? _percorsofile;
  String get percorsofile => _percorsofile ?? '';
  set percorsofile(String? val) => _percorsofile = val;

  String? _copertina;
  String get copertina => _copertina ?? '';
  set copertina(String? val) => _copertina = val;

  static CanzoneLocaleStruct fromMap(Map<String, dynamic> data) =>
      CanzoneLocaleStruct(
        titolo: data['titolo'] as String?,
        autore: data['autore'] as String?,
        percorsofile: data['percorsofile'] as String?,
        copertina: data['copertina'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'titolo': _titolo,
        'autore': _autore,
        'percorsofile': _percorsofile,
        'copertina': _copertina,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => toMap();
}
