import 'package:wayo/features/content/apis/mall_api.dart';

import '../models/mall.dart';

class MallRepository {
  Future<List<Mall>> getMalls() async {
    final malls = <Mall>[];
    final mallApi = MallApi();
    final data = await mallApi.getMalls();

    for (var element in data) {
      malls.add(Mall.fromJson(element));
    }

    return malls;
  }

  Future<Mall?> getMall(String mallId) async {
    final mallApi = MallApi();
    final data = await mallApi.getMall(mallId);

    return Mall.fromJson(data);
  }
}
