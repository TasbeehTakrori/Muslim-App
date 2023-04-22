import 'dart:convert';

import 'package:alquramcommunity_frontend/core/constant/errorhandling.dart';

import '../../data/model/backend_to_front_models/mistake_model.dart';
import '../constant/urls.dart';
import 'package:http/http.dart' as http;

class MistakeServices {
  static void mistakeLogging(List<Map<String, dynamic>> mistakeList) async {
    try {
      // MistakeModel mistakeModel = MistakeModel(
      //     userEmail: userEmail,
      //     mistakeType: mistakeType,
      //     weight: weight,
      //     surahId: surahId,
      //     ayahId: ayahId);
      print("inside mistake log $mistakeList");
      http.Response res = await http.post(
        Uri.parse(MyURL.addAllMistakeURL),
        body: jsonEncode(mistakeList),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print("Response: ${res.toString()}");
    } catch (error) {
      print('noooo $error');
    }
  }

//   final mistake = Mistake(name: 'John', age: 30);

// final response = await http.post(Uri.parse(url),
//     headers: {'Content-Type': 'application/json'},
//     body: jsonEncode(person.toJson()));

// if (response.statusCode == 200) {
//   // تم استلام رد بنجاح
//   print(response.body);
// } else {
//   // حدث خطأ أثناء استلام الرد
//   print('Request failed with status: ${response.statusCode}.');
// }
}