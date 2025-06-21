import 'package:carrot_market_app/src/providers/provider.dart';
import 'package:carrot_market_app/src/utils/logger.dart';
import 'package:get/get.dart';

class FeedProvider extends Provider {
  Future<Map> getList({int page = 1}) async {
    Response resp = await get('/api/feed', query: {'page': page});

    logger.i("Status Code: ${resp.statusCode}");
    logger.i("Body String: ${resp.bodyString}");

    return resp.body;
  }
}
