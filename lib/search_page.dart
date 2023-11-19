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
  String? networkUrl;

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
            networkUrl != null ? Image.network(networkUrl!) : Container(),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              color: Colors.amberAccent,
              onPressed: () async {
                searchModel = SearchModel();
                searchModel = await ApiBaseHelper()
                    .getSearchResponse(searchController.text);
                setState(() {
                  networkUrl = searchModel.drinks![1].strDrinkThumb!;
                });
              },
              child: Text(buttonText),
            )
          ],
        ),
      ),
    );
  }
}
