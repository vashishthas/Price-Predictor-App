import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // String baseUrl="http://127.0.0.1";
  // String baseUrl = "http://192.168.18.1";
  String baseUrl = "https://banglore-price-prediction.herokuapp.com/";

  Future<List<String>> getLocations() async {
    var url = Uri.parse('$baseUrl/get_location_names');
    var res = await http.get(url);
    // print(res.body);
    Map jsonData = jsonDecode(res.body);
    // print(jsonData['locations']);
    List<String> locations = [];
    for (var l in jsonData['locations']) {
      locations.add(l);
    }
    return locations;
  }

  Future<String> getPrice(Map data) async {
    print(data);
    var url = Uri.parse('$baseUrl/predict_home_price');
    var res = await http.post(url, body: data);
    if (res.statusCode == 200) {
      Map jsonData = jsonDecode(res.body);
      print(res.body);
      print(jsonData);
      return jsonData["estimated_price"].toString();
    } else
      return "Some error occured";
  }
}
