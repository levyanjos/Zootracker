import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:zootracker/Model/Animal.dart';

class ZootrackerRepository {

  static Future<String>_loadFromAsset() async {
    return await rootBundle.loadString("assets/animals.json");
  }

  static Future<List<Animal>> getAllAnimals() async {
    String jsonString = await _loadFromAsset();
    Result result = Result.fromRawJson(jsonString);
    return result.animais;
  }
}