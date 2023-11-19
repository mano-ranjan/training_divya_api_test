import 'package:api_test/constants.dart';
import 'package:api_test/search_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ApiBaseHelper {
  Future<SearchModel> getSearchResponse(String searchText) async {
    var res = await http.get(Uri.parse(
        StringConstants.BaseUrl + (searchText.isEmpty ? "mango" : searchText)));

    var jsonRes = convert.jsonDecode(res.body);
    SearchModel searchModel = SearchModel.fromJson(jsonRes);
    return searchModel;
  }
}
