import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:bloc_template/model/cripto_currency.dart';

class CriptoCurrencyRespository {
  Future<CriptoCurrency> getCritocurrency(String criptocurrencyId) async {
    var uri = Uri(
      scheme: 'https',
      host: 'api.coingecko.com',
      path: 'api/v3/coins/markets',
      queryParameters: {
        'vs_currency': 'usd',
        'ids': criptocurrencyId,
      },
    );
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      final List result = convert.jsonDecode(response.body);
      return CriptoCurrency.from(result[0]);
    } else {
      throw Exception(
          'ERROR: getCritocurrency lib/repository/repositories.dart ${response.body}');
    }
  }
}
