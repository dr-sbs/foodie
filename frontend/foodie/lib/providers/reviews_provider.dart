import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './review_provider.dart';

class Reviews with ChangeNotifier {
  List<Review> _items = [];
  List<Review> get items {
    return [..._items];
  }

  Future<void> getReviews(BuildContext context, int id) async {
    try {
      print(id);
      var url = Uri.http('10.0.2.2:8000', 'reviews/foods/$id/');
      late http.Response response;
      response = await http.get(
        url,
      );
      print(response.body);
      final datapage = json.decode(response.body) as Map;

      final List<Review> reviews = [];
      datapage.forEach((key, value) {
        var data = value['results'];
        if (key == 'results') {
          reviews.add(
            Review(
              comment: value['comment'],
              rating: value['ratings'],
              name: value['customer']['full_name'],
            ),
          );
        }
      });

      _items = reviews;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
