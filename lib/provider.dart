import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'modelclass.dart';

class DataProvider with ChangeNotifier {
  List<qustion> Datas = [];

  fetchQuestion() async {
    final response = await http.get(Uri.parse(
        "https://service-zedzat.tequevia.com/api/v1/zedzat/product-category/?category_type=product"));
    print(response.statusCode);
    if (response.statusCode == 200) {
      Datas = weatherFromJson(response.body);

      //  print(response.body);
      // return questionFromJson(response.body);
    } else {
      throw Exception('faild');
    }
    notifyListeners();
  }
}
