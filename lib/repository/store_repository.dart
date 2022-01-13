import 'dart:convert';

import 'package:flutter_mask/model/store.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

class StoreRepository {
  final _distance = Distance();

  Future<List<Store>> fetch(double lat, double lng) async {
    List<Store> stores = [];
    // setState(() {
    //   isLoading = true;
    // });
    var url =
        // https://gist.githubusercontent.com/junsuk5/bb7485d5f70974deee920b8f0cd1e2f0/raw/063f64d9b343120c2cb01a6555cf9b38761b1d94/sample.json?lat=37.266602&lng=126.999376&m=5000
        'https://gist.githubusercontent.com/junsuk5/bb7485d5f70974deee920b8f0cd1e2f0/raw/063f64d9b343120c2cb01a6555cf9b38761b1d94/sample.json?lat=$lat&lng=$lng&m=5000';

    var response = await http.get(Uri.parse(url));
    final jsonResult = jsonDecode(utf8.decode(response.bodyBytes));
    final jsonStores = jsonResult['stores'];

    // stores.clear();
    //setState(() {
    jsonStores.forEach((e) {
      final store = Store.fromJson(e);
      final km = _distance.as(
          LengthUnit.Kilometer, LatLng(store.lat, store.lng), LatLng(lat, lng));
      store.km = km;
      stores.add(store);
      print('킬로미터 확인 : ${km}');
    });
    //isLoading = false;
    //});
    print('위도: ${lat} / 경도 : ${lng}');
    print('패치 완료');

    return stores.where((e) {
      return e.remainStat == 'plenty' ||
          e.remainStat == 'some' ||
          e.remainStat == 'few';
    }).toList()
      ..sort((a, b) => a.km.compareTo(b.km));
  }
}
