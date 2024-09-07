import 'package:http/http.dart';
import 'dart:convert';

class worker {
  String location = "";
  worker({required this.location}) {
    location = this.location;
  }
  String temp = "";
  String humidity = "";
  String air_speed = "";
  String description = "";
  String main = "";
  String icon = "";

//method
  Future<void> display() async {
    // Correct way to parse the URL
    try {
      var url = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=kanpur&appid=3bbdef64df77b5bfe790225569a3234a');
      Response response = await get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      print(data);

      Map<String, dynamic> temp_data = data["main"];
      String GetHumidity = temp_data['humidity'].toString();
      double GetTemperature = temp_data['temp'] - 273.15;
      //air speed
      Map<String, dynamic> wind_data = data["wind"];
      double GetAir_speed = wind_data['speed'] / 0.27777777777778;
      //getting description
      List<dynamic> weather = data['weather'];
      Map<String, dynamic> wed_data = weather[0];
      String GetMain_des = wed_data['main'];
      String GetDescri = wed_data['description'];

      temp = GetTemperature.toString(); //c
      humidity = GetHumidity; //%
      air_speed = GetAir_speed.toString(); //km/hr
      description = GetDescri.toString();
      main = GetMain_des.toString();
      icon = wed_data["icon"].toString();
    } catch (e) {
      temp = "can't find data";
      humidity = "can't find data";
      air_speed = "can't find data";
      description = "can't find data";
      main = "can't find data";
      icon = "o3n";
    }
  }
}
