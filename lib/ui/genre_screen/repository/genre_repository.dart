import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ignite_sol/model/genre.dart';

abstract class GenreRepository {
  Future<List<Genre>> fetchGenre();
}
