import 'package:api_test/search_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ApiBaseHelper {
  Future<SearchModel> getSearchResponse(String searchText) async {
    var res = await http.get(Uri.parse(
        "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=$searchText"));

    var jsonres = convert.jsonDecode(res.body);
    SearchModel searchModel = SearchModel.fromJson(jsonres);
    print("yup yup ${searchModel.drinks?[0].strDrink}");
    return searchModel;
  }
}
