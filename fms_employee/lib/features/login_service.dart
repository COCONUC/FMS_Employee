/*
// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/error_handling.dart';
import '../constants/utils.dart';

//import '../screens/widgets/otp_vertify_screen.dart';

class LoginService {

  void signInUser({
    required context,
    required String username,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('https://computer-services-api.herokuapp.com/auth/login'),
        body: jsonEncode({
          'username': username,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            Provider.of<DataClass>(context, listen: false).setUser(res.body);
            await prefs.setString(
                'refreshToken', jsonDecode(res.body)['refreshToken']);
            Navigator.pushNamedAndRemoveUntil(
                context,
                Provider.of<DataClass>(context, listen: false).user.role ==
                    'customer'
                    ? NavScreen.routeName
                    : StaffHomePage.routeName, //thay staff cho nay
                    (route) => false);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void getUserData(context
      ) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? refreshToken = prefs.getString('refreshToken');
      if (refreshToken == null) {
        prefs.setString('refreshToken', '');
      }
      var tokenRes = await http.post(
          Uri.parse('https://computer-services-api.herokuapp.com/auth/refresh'),
          headers: <String, String>{
            'Context-Type': 'application/json; charset=UTF-8',
            'Cookie': 'refreshToken=$refreshToken',
          });

      var response = jsonDecode(tokenRes.body);
      if (response == true) {
        prefs.setString('refreshToken', response['refreshToken']);
      }
    } catch (e) {
      rethrow;
    }
  }

  void logOut(BuildContext context) async {
    try {
      SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
      await sharedPreferences.setString('accessToken', '');
      await http.post(
        Uri.parse('https://computer-services-api.herokuapp.com/auth/logout'),
      );
      Navigator.pushNamedAndRemoveUntil(
        context,
        AuthScreen.routeName,
            (route) => false,
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
*/
