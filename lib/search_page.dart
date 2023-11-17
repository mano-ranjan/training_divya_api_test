import 'package:api_test/search_model.dart';
import 'package:api_test/services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchModel searchModel = SearchModel();
  String buttonText = "Search";
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 50,
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SearchBar(
              controller: searchController,
            ),
            MaterialButton(
              color: Colors.amberAccent,
              onPressed: () async {
                print("dkvfjbksdvjb ${searchController.text}");
                searchModel = SearchModel();
                searchModel = await ApiBaseHelper()
                    .getSearchResponse(searchController.text);
                setState(() {
                  buttonText = searchModel.drinks![0].strDrink!;
                });
                // var res = await http.get(Uri.parse(
                //     "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=mango"));
                // var jsonres = convert.jsonDecode(res.body);
                // searchModel = SearchModel.fromJson(jsonres);
                // print("yup yup ${searchModel.drinks?[0].strDrink}");
              },
              child: Text(buttonText),
            )
          ],
        ),
      ),
    );
  }
}
