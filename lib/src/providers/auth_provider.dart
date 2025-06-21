import 'package:carrot_market_app/src/providers/provider.dart';

class AuthProvider extends Provider {
  Future<Map> requestPhoneCode(String phone) async {
    final resp = await post('/auth/phone', {'phone': phone});
    return resp.body;
  }

  Future<Map> verifyPhoneNumber(String code) async {
    final resp = await put('/auth/phone', {'code': code});
    return resp.body;
  }

  Future<Map> regist(
    String phone,
    String password,
    String name, [
    int? profile,
  ]) async {
    final resp = await post('/auth/regist', {
      'phone': phone,
      'password': password,
      'name': name,
      'profile': profile,
    });

    return resp.body;
  }
}
