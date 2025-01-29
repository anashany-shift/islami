class QuranRadio {
  QuranRadio({
      num? id, 
      String? name, 
      String? url, 
      String? recentDate,}){
    _id = id;
    _name = name;
    _url = url;
    _recentDate = recentDate;
}

  QuranRadio.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _url = json['url'];
    _recentDate = json['recent_date'];
  }
  num? _id;
  String? _name;
  String? _url;
  String? _recentDate;

  num? get id => _id;
  String? get name => _name;
  String? get url => _url;
  String? get recentDate => _recentDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['url'] = _url;
    map['recent_date'] = _recentDate;
    return map;
  }

}