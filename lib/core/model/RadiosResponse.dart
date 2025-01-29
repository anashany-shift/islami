import 'quran_radio.dart';

class RadiosResponse {
  RadiosResponse({
      List<QuranRadio>? radios,}){
    _radios = radios;
}

  RadiosResponse.fromJson(dynamic json) {
    if (json['radios'] != null) {
      _radios = [];
      json['radios'].forEach((v) {
        _radios?.add(QuranRadio.fromJson(v));
      });
    }
  }
  List<QuranRadio>? _radios;

  List<QuranRadio>? get radios => _radios;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_radios != null) {
      map['radios'] = _radios?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}