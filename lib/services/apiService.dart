import 'dart:convert';

import 'package:http/http.dart';

import '../model/user.dart';

class ApiService{


  Future<ApiUser> getAPIData() async{
    Response response = await get(Uri.parse('https://dummyjson.com/users/1'));
    final userDetails = jsonDecode(response.body);
    // print(userDetails);
    return ApiUser(userDetails['id'],
        userDetails['firstName'],
        userDetails['lastName'],
        userDetails['gender'],
        userDetails['birthDate'],
        userDetails['email'],
        userDetails['address']);

  }


}