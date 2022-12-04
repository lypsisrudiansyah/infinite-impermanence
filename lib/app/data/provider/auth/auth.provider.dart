import 'dart:convert';

import 'package:akm/app/common/constant.dart';
import 'package:akm/app/models/auth/auth.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AuthProvider {
  final httpClient = http.Client();

  Future<Auth> login(String email, String password) async {
    try {
      final response = await httpClient.post(
        Uri.parse('${baseUrl}auth'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );
      debugPrint(response.body);

      if (response.statusCode == 201) {
        var data = jsonDecode(response.body);
        debugPrint(data.toString());
        return Auth.fromJson(data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
