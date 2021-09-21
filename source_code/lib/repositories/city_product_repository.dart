import 'package:active_ecommerce_flutter/app_config.dart';
import 'package:http/http.dart' as http;
import 'package:active_ecommerce_flutter/data_model/city_product_response.dart';

class CityRepository {

  Future<CityProductResponse> getFilterPageCities({name = ""}) async {
    final response =
    await http.get("https://easykhareed.com/api/cities");
    print("https://easykhareed.com/api/cities");
    print(response.body.toString());
    return cityproductResponseFromJson(response.body);
  }
 


}
