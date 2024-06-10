import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'user_model.dart';

class UserViewModel {
  Future<List<UserModel>?> getUsers() async {
    try {
      http.Response hasil = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/users"),
        headers: {"Accept": "application/json"},
      );
      if (hasil.statusCode == 200) {
        if (kDebugMode) {
          print("Data fetched successfully");
        }
        final List<dynamic> data = json.decode(hasil.body);
        final List<UserModel> users = data.map((json) => UserModel.fromJson(json)).toList();
        return users;
      } else {
        if (kDebugMode) {
          print("Error status: ${hasil.statusCode}");
        }
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error catch: $e");
      }
      return null;
    }
  }
}
