import 'dart:convert';

import 'package:flutter_application_1/Example/Example5_Bloc_API_Fetch/repos/user_model.dart';
import 'package:http/http.dart';

class UserRepository {
  String endpoint = 'https://reqres.in/api/users?page=2';

  getUsers() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      //it takes data section
      final List result = jsonDecode(response.body)['data'];
      return result.map(((e) => UserModel.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
