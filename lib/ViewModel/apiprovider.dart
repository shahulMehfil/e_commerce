import 'package:e_commerce/Model/modelclass.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

enum providerstatus { LOADING, COMPLETE }

class Providerprofile with ChangeNotifier {
  // List<Product> mylist = [];
   Modellist? datas;
  int buttonindex = -1;
  providerstatus status = providerstatus.LOADING;
  fetchquestion() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products'));
    if (response.statusCode == 200) {
      status = providerstatus.COMPLETE;
      datas = welcomeFromJson(response.body);
    } else {
      throw Exception('error');
    }
    notifyListeners();
  }

//   List<int> shoppingsample = [];
//   late SharedPreferences _prefs;
//   loadData() async {
//     _prefs = await SharedPreferences.getInstance();
//     List<String>? stringNumbers = _prefs.getStringList('numbers');
//     if (stringNumbers != null) {
//       List<int> numbers = stringNumbers
//           .map((stringNumbers) => int.parse(stringNumbers))
//           .toList();

//       shoppingsample = numbers;
//     }
//     notifyListeners();
//   }

//   Future<void> saveData() async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     List<String> stringNumbers = shoppingsample
//         .map((shoppingsample) => shoppingsample.toString())
//         .toList();
//     await pref.setStringList('numbers', stringNumbers);
//   }
//     notifyListeners();
// }
}
