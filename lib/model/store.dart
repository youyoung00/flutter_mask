class Store {
  Store({
    required this.addr,
    required this.code,
    required this.createdAt,
    required this.lat,
    required this.lng,
    required this.name,
    required this.remainStat,
    required this.stockAt,
    required this.type,
  });
  final String addr;
  final String code;
  final String createdAt;
  final num lat;
  final num lng;
  late final String name;
  final String remainStat;
  final String stockAt;
  late final String type;

  factory Store.fromJson(
      Map<String, dynamic> json) //: addr = json['addr'] ?? 'dsf', ;
  {
    return Store(
      addr: json['addr'],
      code: json['code'],
      createdAt: json['created_at'] ?? '정보 없음',
      lat: json['lat'],
      lng: json['lng'],
      name: json['name'],
      remainStat: json['remain_stat'] ?? '매진',
      stockAt: json['stock_at'] ?? '정보 없음',
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['addr'] = addr;
    _data['code'] = code;
    _data['created_at'] = createdAt;
    _data['lat'] = lat;
    _data['lng'] = lng;
    _data['name'] = name;
    _data['remain_stat'] = remainStat;
    _data['stock_at'] = stockAt;
    _data['type'] = type;
    return _data;
  }
}
