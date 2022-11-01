import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../../constants/error_handling.dart';

class AuthService {
  void signUpUser(
      {required String email,
      required BuildContext context,
      required String password,
      required String name}) async {
    try {
      User user = User('', name, email, '', '', '', password);
      http.Response res = await http.post(Uri.parse('$uri/api/signup'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });
      httpErrorHandler(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(
              context,
              'Account created! Login with the same credentials!',
            );
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
