import 'package:http/http.dart' as http;
import 'package:active_ecommerce_flutter/data_model/city_product_response.dart';

class CityRepository {
  Future<CityProductResponse> getFilterPageCities() async {
    final response = await http.get("https://easykhareed.com/api/cities");
    return cityproductResponseFromJson(response.body);
  }

  Future<CityProductResponse> getCities({name = "", page = 1}) async {
    final response = await http
        .get("https://easykhareed.com/api/cities" + "?page=${page}&name=${name}");
    return cityproductResponseFromJson(response.body);
  }
}
