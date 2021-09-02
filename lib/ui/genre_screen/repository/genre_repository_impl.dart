import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:ignite_sol/model/genre.dart';

import 'genre_repository.dart';
import 'dart:async';

class GenreRepositoryImpl extends GenreRepository {
  @override
  Future<List<Genre>> fetchGenre() async {
    try {
      final String response =
          await rootBundle.loadString('assets/json/genre.json');
      final data = await json.decode(response);
      return Genre.listFromJson(data);
    } catch (e) {
      rethrow;
    }
  }
}
